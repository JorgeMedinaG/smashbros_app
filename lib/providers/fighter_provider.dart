import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:smashbros_app/models/fighter.dart';
import 'package:smashbros_app/services/db_service.dart';
export 'package:smashbros_app/models/fighter.dart';

class FighterProvider extends ChangeNotifier {

  FighterProvider(){
    initializeFighters();
  }

  final String _baseurl = '593cdf8fb56f410011e7e7a9.mockapi.io';

  List<Fighter> _fighterList = [];
  List<Fighter> _filteredList = [];
  List<Fighter> _allFighters = [];

  SortValues? _sortRadio = SortValues.nameAsc;
  RangeValues _priceRange = const RangeValues(100,800);
  int _rateValue = 0;
  int get rateValue => _rateValue;

  List<Fighter> get fighterList {
    if (_activeFilter) return _filteredList;
    return _fighterList;
  }
  set fighterList(List<Fighter> newList){
    _fighterList = newList;
    notifyListeners();
  } 

  SortValues? get sortRadio => _sortRadio;
  set sortRadio (SortValues? value){
    _sortRadio = value;
    notifyListeners();
  }

  RangeValues get priceRange => _priceRange;
  set priceRange (RangeValues values){
    _priceRange = values;
    notifyListeners();
  }

  set rateValue (int value){
    _rateValue = value;
    notifyListeners();
  }

  bool _activeFilter = false;
  bool get activeFilter => _activeFilter;
  set activeFilter (bool value){
    _activeFilter = value;
    notifyListeners();
  }

  List<int> get minMax {
    
    _allFighters.sort((a, b) => a.price.compareTo(b.price) );
    return [_allFighters.first.price, _allFighters.last.price];
  }

  void initializeFighters() async {
    await getFighterList();
    DBService.db.insertAllFighters(_allFighters);
  }

  void clearFilter(){
    _sortRadio = SortValues.nameAsc;
    _priceRange = const RangeValues(100,800);
    _rateValue = 0;
    _activeFilter = false;
    notifyListeners();
  }

  Future<void> getFighterList() async {
    final Uri url = Uri.https(_baseurl, 'fighters');
    dynamic jsonData;
    try {     
      jsonData = await _getRequest(url);
      _fighterList = List<Fighter>.from(jsonData.map((e) => Fighter.fromJson(e)));
    } catch (e) {
      _fighterList = await DBService.db.fighters();
    }
    _allFighters = fighterList;
    notifyListeners();
  }

  Future<void> getFightersByUniverse(String universeName) async {
    final Uri url = Uri.https(_baseurl, 'fighters', {
      'universe' : universeName
    });
    dynamic jsonData;
    try {
      jsonData = await _getRequest(url);
      _fighterList = List<Fighter>.from(jsonData.map((e) => Fighter.fromJson(e)));
    } catch (e) {
      _fighterList = await DBService.db.fightersByUniverse(universeName);
    }
    notifyListeners();
  }

  Future<void> refreshList(String universename) async {
    fighterList = [];
    notifyListeners();
    if (universename == '' || universename == "All"){
      await getFighterList();
    } else {
      await getFightersByUniverse(universename);
    }
    notifyListeners();
  }

  void filterList(Map<String, dynamic> filters){
    
    if (filters['rate'] == 0){
      _filteredList = _fighterList.where((i) => i.price >= filters['priceDown'] && i.price<=filters['priceUp']).toList();
    } else {
      _filteredList = _fighterList.where((i) => i.price >= filters['priceDown'] && i.price<=filters['priceUp'] && i.rate == filters['rate']).toList();
    }
    notifyListeners();
  }

  void sortList(SortValues? sortParameter){
  
    switch(sortParameter){
      case SortValues.nameAsc:
        _filteredList.sort((a, b) => a.name.compareTo(b.name) );
        break;
      case SortValues.nameDesc:
        _filteredList.sort((a, b) => b.name.compareTo(a.name) );
        break;
      case SortValues.downloads:
        _filteredList.sort((a,b)=> a.downloads.compareTo(b.downloads));
        break;
      case SortValues.rate:
        _filteredList.sort((a,b) => a.rate.compareTo(b.rate));
        break;
      default:
        _filteredList.sort((a, b) => a.name.compareTo(b.name) );
        break;

    }

  
  }

  Future<List<dynamic>> _getRequest(Uri url) async {

    http.Response? response;
    List<dynamic> decodedResp = [];

    try {
      response = await http.get(url);
    } catch (e) {
      throw Exception();
    }

    if (response.statusCode == 200){
     decodedResp = jsonDecode(response.body);
    }

    return decodedResp;
  }

    Future<bool> _internetAccess() async {

    bool flag = true;
    
    while(flag){
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          await Future.delayed(Duration(seconds: 2));
          flag = false;
        }
      } on SocketException catch (_) {
        await Future.delayed(Duration(seconds: 3));
      }
    }
    return true;
  }

}

enum SortValues { nameAsc, nameDesc, rate, downloads}
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:smashbros_app/models/universe.dart';
export 'package:smashbros_app/models/universe.dart';

class UniverseProvider extends ChangeNotifier{

  final String _baseurl = '593cdf8fb56f410011e7e7a9.mockapi.io';
  List<Universe> universeList = [];


  UniverseProvider() {
    print("Provider Inicializado");
    getUniverseList(); 
  }
  
  Universe _selectedUniverse = Universe(objectId: "2332", name : "All");
  Universe get selectedUniverse => _selectedUniverse;
  set selectedUniverse(Universe value){
    _selectedUniverse = value;
    notifyListeners();
  }

  void getUniverseList() async {

    final Uri url = Uri.https(_baseurl, 'universes');
    final jsonData = await _getRequest(url);
    universeList = List<Universe>.from(jsonData.map((e) => Universe.fromJson(e)));
    notifyListeners();
  }

  Future<List<dynamic>> _getRequest(Uri url) async {

    http.Response? response;
    List<dynamic> decodedResp = [];

    try {
      response = await http.get(url);
    } catch (e) {
      print(e.toString());
    }

    if (response?.statusCode == 200){
     decodedResp = jsonDecode(response?.body ?? '');
    }

    return decodedResp;
  }
  


}
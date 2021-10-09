import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:smashbros_app/models/fighter.dart';
export 'package:smashbros_app/models/fighter.dart';

class FighterProvider extends ChangeNotifier {

  final String _baseurl = '593cdf8fb56f410011e7e7a9.mockapi.io';
  List<Fighter> fighterList = [];

  FighterProvider(){
    getFighterList();
  }

  void getFighterList() async {
    final Uri url = Uri.https(_baseurl, 'fighters');
    final jsonData = await _getRequest(url);
    fighterList = List<Fighter>.from(jsonData.map((e) => Fighter.fromJson(e)));
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
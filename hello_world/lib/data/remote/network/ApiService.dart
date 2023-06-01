import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:hello_world/models/moviesList/TVModel.dart';
import 'package:http/http.dart' as http;

class ApiService{

  Future<List<TvModel>?> getUsers() async {
    try {
      var url = Uri.parse("https://run.mocky.io/v3/8d353ba3-739f-4724-9ce3-6fdc8de3af20");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<TvModel> _model = tvModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }


}
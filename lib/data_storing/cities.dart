import 'dart:convert';
import 'package:breakaway/views/region_view.dart';
import 'package:flutter/services.dart' show rootBundle;

class CityService {
  Future<List<City>> fetchCities() async {
    final jsonData = await rootBundle.loadString('assets/json/cities.json');
    final List<dynamic> jsonList = json.decode(jsonData);
    return jsonList.map((json) => City.fromJson(json)).toList();
  }
}

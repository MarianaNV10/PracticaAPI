import 'dart:convert';

import '../models/response_api.dart';
import 'package:http/http.dart' as http;

class TheDogApi{
  Future<ResponseApi> getMeals() async{
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?f=b'));
    print("resultado ${response.body}");

    if(response.statusCode == 200){
      return ResponseApi.fromJson(jsonDecode(response.body));
    }else{
      print("status code ${response.statusCode}");
      throw Exception('Failed to load movies');
    }

  }
}
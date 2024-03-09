import 'package:dio/dio.dart';

import 'dart:convert';

void parseJson(String jsonString) {
  Map<String, dynamic> jsonData = json.decode(jsonString);
  // Access data from the JSON object
  var item = jsonData;
  print(item);
  print('null mohammed');
}
final dio = Dio();

void getHttp() async {
  final response = await dio.get('https://student.valuxapps.com/api/home');
  print(response);
  print('===================================================================');
  parseJson(response.toString());
  
}

//do not do this at home !!!

void main(){
  getHttp();
}
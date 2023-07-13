import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testambient/class/weather.dart';


class Weather{
Future<WeatherModel>getWeather(String location) async{
  var endpoint = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=ad180cd20268d5ba6a04b966ca7a2a97&units=metric');
  var respone = await http.get(endpoint);
  var body = jsonDecode(respone.body);
  print(WeatherModel.fromjson(body).cityName);
  return WeatherModel.fromjson(body) ;
  }
}


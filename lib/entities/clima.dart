import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:testambient/class/http.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart' as http;
import 'apiClient.dart';


Future<LocationData> obtenerUbicacion() async {
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      throw Exception("Error");;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      throw Exception("Error");;
    }
  }

  _locationData = await location.getLocation();
  return _locationData;
}

Future<String> obtenerDatosClima(double? latitud, double? longitud) async {
  String apiKey = 'ad180cd20268d5ba6a04b966ca7a2a97';
  String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitud&lon=$longitud&appid=$apiKey';

  http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception("Error");
  }
}
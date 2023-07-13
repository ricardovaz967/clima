import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:testambient/class/http.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart' as http;
import 'apiClient.dart';
import 'clima.dart';




class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  String _clima = '';

  void initState() {
    super.initState();
    obtenerDatosDelClima();
  }

  void obtenerDatosDelClima() async {
    LocationData ubicacion = await obtenerUbicacion();
    String datosClima = await obtenerDatosClima(ubicacion.latitude, ubicacion.longitude);

    setState(() {
      _clima = datosClima;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_clima),
    );
  }
}
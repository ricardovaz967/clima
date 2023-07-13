import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:testambient/class/weather.dart';
import 'package:wear/wear.dart';
import 'package:weather_icons/weather_icons.dart';

import '../class/http.dart';

class CurrentWeatherPage extends StatefulWidget {
  final WearMode mode;

  const CurrentWeatherPage(this.mode, {Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  Weather client = Weather();
  WeatherModel? data;

  Future<WeatherModel> getData() async {
    WeatherModel result = await client.getWeather('San Juan del Río');
    return result;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Column(
      children: [
        Text(
          '28°',
          style: TextStyle(
            color: widget.mode == WearMode.active ? Colors.black : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Lluvia',
          style: TextStyle(
            color: widget.mode == WearMode.active ? Colors.black : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'San Juan del Río',
          style: TextStyle(
            color: widget.mode == WearMode.active ? Colors.blue : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

import 'package:final_weather/screens.dart/location_screen.dart';
import 'package:flutter/material.dart';

import 'screens.dart/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LocationScreen(
        locationWeather: null,
      ),
    );
  }
}

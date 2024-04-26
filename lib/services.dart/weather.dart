import 'package:final_weather/services.dart/location.dart';
import 'package:final_weather/services.dart/networking.dart';
import 'package:flutter/material.dart';

const apiKey = '785bbc38e5ecd1a4507f8df8b366755e';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = networkHelper.getData();
    return weatherData;
  }

  Image getWeatherIcon(int condition) {
    if (condition < 300) {
      return Image.asset(
        'images/thunderstorm.gif',
        height: 200,
        width: 200,
      );
    } else if (condition < 400) {
      return Image.asset(
        'images/drizzle.gif',
        height: 200,
        width: 200,
      );
    } else if (condition < 600) {
      return Image.asset(
        'images/rainy.gif',
        height: 200,
        width: 200,
      );
    } else if (condition < 700) {
      return Image.asset(
        'images/snowy.gif',
        height: 200,
        width: 200,
      );
    } else if (condition < 800) {
      return Image.asset(
        'images/hazy.gif',
        height: 200,
        width: 200,
      );
    } else if (condition == 800) {
      return Image.asset(
        'images/final.gif',
        height: 200,
        width: 200,
      );
    } else if (condition <= 804) {
      return Image.asset(
        'images/cloudy.gif',
        height: 200,
        width: 200,
      );
    } else {
      return Image.asset(
        'images/final.gif',
        height: 200,
        width: 200,
      );
    }
  }

  String getMessage(DateTime time) {
    var time = DateTime.now();
    if (time.hour < 12) {
      return 'Good Morning';
    } else if (time.hour >= 12 && time.hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}

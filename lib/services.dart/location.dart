import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      LocationPermission permission2 = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }
}

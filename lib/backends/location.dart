import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation {
  static String address = '';
  static void locatePosition() async {
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      final coordinates =
          new Coordinates(currentPosition.latitude, currentPosition.longitude);
      var placemark =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = placemark.first;
      print("${first.locality} : ${first.adminArea}");
      address = first.locality.toString();
    } on PlatformException catch (e) {
      print('${e.message} to find location');
      address = 'Unknown';
    }
  }
}

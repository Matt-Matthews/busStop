import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusStopsData {
  static int time = int.parse(DateTime.now().hour.toString());
  static int hour;
  static int busTime() {
    if (time >= 18 && time <= 5) {
      hour = 5;
    } else if (time >= 6 && time <= 7) {
      hour = 7;
    } else if (time >= 8 && time <= 12) {
      hour = 12;
    } else if (time >= 13 && time <= 14) {
      hour = 14;
    } else if (time >= 15 && time <= 17) {
      hour = 17;
    }
    return hour;
  }

  static Marker firstMarker = Marker(
    markerId: MarkerId('5'),
    position: LatLng(-23.8125083, 29.3664495),
    infoWindow: InfoWindow(title: '${busTime()} : 30'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  ); //Makgofe markers

  //seshego
  static Marker sesMarker = Marker(
    markerId: MarkerId('1'),
    position: LatLng(-23.84729, 29.376765),
    infoWindow: InfoWindow(title: '${busTime()} : 10'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  static Marker eigMarker = Marker(
    markerId: MarkerId('2'),
    position: LatLng(-23.854944, 29.381529),
    infoWindow: InfoWindow(title: '${busTime()} : 20'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  static Marker foftMarker = Marker(
    markerId: MarkerId('3'),
    position: LatLng(-23.847997, 29.393261),
    infoWindow: InfoWindow(title: '${busTime()} : 30'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  static Marker thirMarker = Marker(
    markerId: MarkerId('4'),
    position: LatLng(-23.836142, 29.389887),
    infoWindow: InfoWindow(title: '${busTime()} : 40'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  ); //seshego markers
  static Marker fifMarker = Marker(
    markerId: MarkerId('6'),
    position: LatLng(-23.8223626, 29.3690674),
    infoWindow: InfoWindow(title: '${busTime()} : 30'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  ); //blood river

  //mankweng
  static Marker tweMarker = Marker(
    markerId: MarkerId('7'),
    position: LatLng(-23.8895134, 29.6987999),
    infoWindow: InfoWindow(title: '${busTime()} : 20'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  static Marker ninMarker = Marker(
    markerId: MarkerId('8'),
    position: LatLng(-23.889356, 29.666179),
    infoWindow: InfoWindow(title: '${busTime()} : 30'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  ); //mankweng markers

  //polokwane
  static Marker thirtMarker = Marker(
    markerId: MarkerId('9'),
    position: LatLng(-23.895296, 29.456872),
    infoWindow: InfoWindow(title: '${busTime()} : 30'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  static Marker tenMarker = Marker(
    markerId: MarkerId('10'),
    position: LatLng(-23.899892, 29.449958),
    infoWindow: InfoWindow(title: '${busTime()} : 20'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  static Marker eleMarker = Marker(
    markerId: MarkerId('11'),
    position: LatLng(-23.9183746, 29.4561681),
    infoWindow: InfoWindow(title: '${busTime()} : 50'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  static Marker fiftMarker = Marker(
    markerId: MarkerId('12'),
    position: LatLng(-23.900087, 29.443515),
    infoWindow: InfoWindow(title: '${busTime()} : 10'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
  static Marker secMarker = Marker(
    markerId: MarkerId('13'),
    position: LatLng(-23.911910, 29.448704),
    infoWindow: InfoWindow(title: '${busTime()} : 55'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );

  static Marker forMarker = Marker(
    markerId: MarkerId('14'),
    position: LatLng(-23.909189, 29.464801),
    infoWindow: InfoWindow(title: '${busTime()} : 45'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );

  static Marker sisMarker = Marker(
    markerId: MarkerId('15'),
    position: LatLng(-23.905771, 29.456819),
    infoWindow: InfoWindow(title: '${busTime()} : 40'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  ); //polokwane markers
  static Marker bMarker = Marker(
    markerId: MarkerId('16'),
    position: LatLng(-23.950169, 29.798739),
    infoWindow: InfoWindow(title: '${busTime()} : 30'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueRed,
    ),
  );
}

import 'dart:ui';
import 'package:BusStop/backends/busstops.dart';
import 'package:BusStop/backends/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:BusStop/widgets/header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:BusStop/backends/busstops.dart';

class BusStops extends StatefulWidget {
  const BusStops({Key key}) : super(key: key);

  @override
  _BusStopsState createState() => _BusStopsState();
}

class _BusStopsState extends State<BusStops> {
  final LatLng _center = const LatLng(45.521563, -122.677433);
  Position currentPosition;
  GoogleMapController mapController;
  TextEditingController controller = TextEditingController();
  void locatePosition() async {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng latlinPosition =
        LatLng(currentPosition.latitude, currentPosition.longitude);
    //getPlaces(latlinPosition);
    CameraPosition cameraPosition =
        new CameraPosition(target: latlinPosition, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void cameraPos(LatLng location) {
    CameraPosition cameraPosition =
        new CameraPosition(target: location, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    locatePosition();
  }

  List<Marker> markers = [];
  List<Marker> defaultMarkers = [];
  List<Marker> polokwaneMarkers = [];
  List<Marker> seshegoMarkers = [];
  List<Marker> mankwengMarkers = [];
  List<Marker> makgofeMarkers = [];
  List<Marker> bloodRiverMarkers = [];
  List<Marker> boyneMarkers = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    intilize();
    super.initState();
  }

  intilize() {
    Marker firstMarker = BusStopsData.firstMarker;
    Marker secMarker = BusStopsData.secMarker;
    Marker thirMarker = BusStopsData.thirMarker;
    Marker forMarker = BusStopsData.forMarker;
    Marker fifMarker = BusStopsData.fifMarker;
    Marker sisMarker = BusStopsData.sisMarker;
    Marker sesMarker = BusStopsData.sesMarker;
    Marker eigMarker = BusStopsData.eigMarker;
    Marker ninMarker = BusStopsData.ninMarker;
    Marker tenMarker = BusStopsData.tenMarker;
    Marker eleMarker = BusStopsData.eleMarker;
    Marker tweMarker = BusStopsData.tweMarker;
    Marker thirtMarker = BusStopsData.thirtMarker;
    Marker foftMarker = BusStopsData.foftMarker;
    Marker fiftMarker = BusStopsData.fiftMarker;
    Marker bMarker = BusStopsData.bMarker;

    boyneMarkers.add(bMarker);
    makgofeMarkers.add(firstMarker);
    polokwaneMarkers.add(secMarker);
    seshegoMarkers.add(thirMarker);
    polokwaneMarkers.add(forMarker);
    bloodRiverMarkers.add(fifMarker);
    polokwaneMarkers.add(sisMarker);
    seshegoMarkers.add(sesMarker);
    seshegoMarkers.add(eigMarker);
    mankwengMarkers.add(ninMarker);

    polokwaneMarkers.add(tenMarker);
    polokwaneMarkers.add(eleMarker);
    mankwengMarkers.add(tweMarker);
    polokwaneMarkers.add(thirtMarker);
    seshegoMarkers.add(foftMarker);
    polokwaneMarkers.add(fiftMarker);
    if (GetLocation.address.toUpperCase() == 'POLOKWANE') {
      markers = polokwaneMarkers;
      defaultMarkers = polokwaneMarkers;
    } else if (GetLocation.address.toUpperCase() == 'SESHEGO') {
      markers = seshegoMarkers;
      defaultMarkers = seshegoMarkers;
    } else if (GetLocation.address.toUpperCase() == 'MANKWENG') {
      markers = mankwengMarkers;
      defaultMarkers = mankwengMarkers;
    } else if (GetLocation.address.toUpperCase() == 'BLOOD RIVER') {
      markers = bloodRiverMarkers;
      defaultMarkers = bloodRiverMarkers;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center),
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            compassEnabled: true,
            mapType: MapType.normal,
            markers: markers.map((e) => e).toSet(),
          ),
          W_Headers(),
          Transform.translate(
              offset: Offset(5.0, 70.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                height: 45,
                width: 400,

                //SizedBox(width: 10),
              )),
          Transform.translate(
            offset: Offset(10.0, 78.0),
            child: Icon(
              Icons.location_on,
              color: Color(0xffbF4511E),
              size: 30,
            ),
          ),
          Transform.translate(
              offset: Offset(35.0, 50.0),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      height: 40,
                      margin: EdgeInsets.only(top: 19),
                      child: TextFormField(
                        style: TextStyle(color: const Color(0xffbF4511E)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'village or town name',
                        ),
                        textInputAction: TextInputAction.done,
                        controller: _controller,
                        onChanged: (text) {
                          if (_controller.text.trim().toUpperCase() ==
                              'POLOKWANE') {
                            setState(() {
                              markers = polokwaneMarkers;
                              cameraPos(LatLng(-23.9089937, 29.4480369));
                            });
                          } else if (_controller.text.trim().toUpperCase() ==
                              'SESHEGO') {
                            setState(() {
                              markers = seshegoMarkers;
                              cameraPos(LatLng(-23.8470551, 29.3882701));
                            });
                            print('seshego');
                          } else if (text.trim().toUpperCase() == 'MANKWENG') {
                            setState(() {
                              markers = mankwengMarkers;
                              cameraPos(LatLng(-23.8895134, 29.6987999));
                            });
                          } else if (text.trim().toUpperCase() ==
                              'BLOOD RIVER') {
                            setState(() {
                              markers = bloodRiverMarkers;
                              cameraPos(LatLng(-23.8179263, 29.3658487));
                            });
                          } else if (text.trim().toUpperCase() == 'MAKGOFE') {
                            setState(() {
                              markers = makgofeMarkers;
                              cameraPos(LatLng(-23.950169, 29.796545));
                            });
                          } else if (text.trim().toUpperCase() == 'BOYNE') {
                            setState(() {
                              markers = boyneMarkers;
                              cameraPos(LatLng(-23.950169, 29.798739));
                            });
                          } else {
                            setState(() {
                              markers = defaultMarkers;
                              cameraPos(LatLng(currentPosition.latitude,
                                  currentPosition.longitude));
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 355,
                      height: 1,
                      color: Color(0xffbF4511E),
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

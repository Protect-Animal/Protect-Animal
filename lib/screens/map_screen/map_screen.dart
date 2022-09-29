import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protectanimal/screens/main_first/components/home_header.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool isMapCreated = false;
  late GoogleMapController _controller;
  static final CameraPosition huvsgul = CameraPosition(
    target: LatLng(50.7522875, 100.1182886),
    zoom: 8,
  );
  getAnimals() async {
    print('get animals');
  }

  @override
  void initState() {
    getAnimals();
    super.initState();
  }

  changeMapMode() {
    print('called set map style');
    getJsonFile('assets/style/darkmapstyle.json').then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    if (isMapCreated) {
      print('true');
      changeMapMode();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const HomeHeader(),
      ),
      backgroundColor: Colors.indigo,
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: huvsgul,
          onMapCreated: (GoogleMapController controller) {
            // _controller.complete(controller);
            _controller = controller;
            isMapCreated = true;
            changeMapMode();
            setState(() {});
          },
        ),
      ),
    );
  }
}

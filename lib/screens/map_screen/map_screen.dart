import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:protectanimal/models/animal.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/services/animal_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:protectanimal/screens/main_first/components/home_header.dart';
import 'package:protectanimal/screens/map_screen/widgets/bottom_sheet_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Marker> markers = [];
  late dynamic animals;
  bool isMapCreated = false;
  late GoogleMapController _controller;
  static const CameraPosition huvsgul = CameraPosition(
    target: LatLng(50.7522875, 100.1182886),
    zoom: 8,
  );
  onMapTap(lat, lng, argument) async {
    final bytes = await getResizedIcon(imgurl);
    if (markers.length == 1) {
      markers.remove(const Marker(markerId: MarkerId('selectedLocation')));
    }
    markers.add(Marker(
        markerId: const MarkerId('selectedLocation'),
        position: argument,
        icon: BitmapDescriptor.fromBytes(bytes),
        flat: true,
        infoWindow: const InfoWindow(title: 'selected locatikon')));
    setState(() {});
  }

  getAnimals() async {
    animals = await AnimalServies().getAnimals();
    print('${animals.length} length');
    for (var i = 0; i < animals.length; i++) {
      addMarkers(i);
    }
  }

  addMarkers(index) async {
    print(index);
    final bytes = await getResizedIcon(animals[index].image[0]);
    markers.add(Marker(
      onTap: () {
        markerOnTap(animals[index]);
      },
      markerId: MarkerId('selectedLocation $index'),
      position: LatLng(
          animals[index].coordinates.lat, animals[index].coordinates.lng),
      icon: BitmapDescriptor.fromBytes(bytes),
      flat: true,
    ));
    setState(() {});
  }

  markerOnTap(animal) {
    print(animal);
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => BottomSheetMap(animal: animal),
    );
  }

  @override
  void initState() {
    getAnimals();
    print(markers.length);
    super.initState();
  }

  Widget buildsheet(Animal animal) {
    return Container();
  }

  String imgurl =
      'https://media.istockphoto.com/photos/red-deer-picture-id1204704325?b=1&k=20&m=1204704325&s=170667a&w=0&h=cl8LGCpNNSTuFfTd7Dd4dwLPH8ViqUAc9g-EBOR8YBY=';
  markerIconFromUrl(imgurl) async {
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl)).load(imgurl))
        .buffer
        .asUint8List();
    return bytes;
  }

  final int targetWidth = 250;
  getResizedIcon(imageUrl) async {
    final File markerImageFile =
        await DefaultCacheManager().getSingleFile(imageUrl);
    final Uint8List markerImageBytes = await markerImageFile.readAsBytes();
    final Codec markerImageCodec = await instantiateImageCodec(markerImageBytes,
        targetWidth: targetWidth, targetHeight: targetWidth);
    final FrameInfo frameInfo = await markerImageCodec.getNextFrame();
    final ByteData? byteData = await frameInfo.image.toByteData(
      format: ImageByteFormat.png,
    );
    final Uint8List resizedMarkerImageBytes = byteData!.buffer.asUint8List();
    return resizedMarkerImageBytes;
  }

  @override
  Widget build(BuildContext context) {
    if (isMapCreated) {
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
      backgroundColor: black,
      body: Container(
        child: GoogleMap(
          markers: Set.of(markers),
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: huvsgul,
          // onTap: (argument) {
          //   onMapTap(argument.latitude, argument.longitude, argument);
          // },
          onMapCreated: (GoogleMapController controller) {
            controller.showMarkerInfoWindow(const MarkerId("selectedLocation"));
            _controller = controller;
            isMapCreated = true;
            changeMapMode();
            setState(() {});
          },
        ),
      ),
    );
  }

  changeMapMode() {
    getJsonFile('assets/style/darkmapstyle.json').then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }
}

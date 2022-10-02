import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:protectanimal/models/animal.dart';
import 'package:protectanimal/screens/main_first/components/home_header.dart';
import 'package:protectanimal/services/animal_services.dart';
import 'package:protectanimal/utils/constants.dart';
import 'package:protectanimal/widgets/custom_avatar.dart';
import 'package:protectanimal/widgets/custom_button.dart';
import 'package:protectanimal/widgets/custom_text.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});

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
      markers.remove(Marker(markerId: MarkerId('selectedLocation')));
    }
    markers.add(Marker(
        markerId: MarkerId('selectedLocation'),
        position: argument,
        icon: BitmapDescriptor.fromBytes(bytes),
        flat: true,
        infoWindow: const InfoWindow(title: 'selected location')));
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
      // isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => buildsheet(),
    );
  }

// showModalBottomSheet(
//       barrierColor: Colors.transparent,
//       elevation: 0,
//       isDismissible: true,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
//       backgroundColor: bottomsheetcolor,
//       builder: (BuildContext context) {
//         return DraggableScrollableSheet(
//           initialChildSize: 1,
//           builder: (BuildContext context, ScrollController scrollController) =>
//
//         );
//       },
//       context: context,
//     );
  @override
  void initState() {
    getAnimals();
    print(markers.length);
    super.initState();
  }

  Widget buildsheet() => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.8,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) =>
            Container(
          decoration: BoxDecoration(
              color: bottomsheetcolor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30))),
          child: ListView(
            controller: scrollController,
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Positioned(
                    top: 15,
                    child: Container(
                      height: 5,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: smallPadding),
                        // height: 400,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(smallPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: 'name',
                                        size: 20,
                                      ),
                                      SizedBox(height: smallPadding),
                                      CustomText(
                                          w: FontWeight.w400,
                                          text:
                                              'Kingston upon Thames KT1 1JP, English',
                                          isMedium: true)
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(Icons.cloud, color: white),
                                      SizedBox(width: extrasmallPadding),
                                      CustomText(text: '17C')
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: extrasmallPadding),
                              Row(
                                children: [
                                  Row(
                                    children: const [
                                      Icon(Icons.directions_car, color: white),
                                      SizedBox(width: extrasmallPadding),
                                      CustomText(
                                        text: '24KM',
                                        w: FontWeight.w400,
                                        isMedium: true,
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: extrasmallPadding),
                                  Row(
                                    children: const [
                                      Icon(Icons.favorite_outline,
                                          color: white),
                                      SizedBox(width: extrasmallPadding),
                                      CustomText(
                                        text: 'Loved',
                                        w: FontWeight.w400,
                                        isMedium: true,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: smallPadding),
                              SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.all(4.0),
                                      width: 88,
                                      height: 88,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        child: Image.network(
                                            fit: BoxFit.cover,
                                            'https://images.unsplash.com/photo-1589656966895-2f33e7653819?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: smallPadding),
                              CustomButton(text: 'I want more information'),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        color: textFldBorderColor,
                      ),
                      ListTile(
                        leading: CustomAvatar(
                            height: 48,
                            width: 48,
                            image:
                                'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                        title: Row(
                          children: [
                            CustomText(text: 'Cameron Williamson'),
                            Container(
                              margin: const EdgeInsets.all(smallPadding),
                              width: 3,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            CustomText(
                              w: FontWeight.w500,
                              text: 'Just now',
                              textColor: textMediumColor,
                            )
                          ],
                        ),
                        subtitle: const CustomText(
                          text:
                              'Look at those ears and that neck things a bruiser! I cannot imagine seeing something like that living in NJ were lucky if traffic doesn’t get anything over a few years old at least by me!',
                          isMedium: true,
                          w: FontWeight.w500,
                        ),
                      ),
                      ListTile(
                        leading: CustomAvatar(
                            height: 48,
                            width: 48,
                            image:
                                'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                        title: Row(
                          children: [
                            CustomText(text: 'Cameron Williamson'),
                            Container(
                              margin: const EdgeInsets.all(smallPadding),
                              width: 3,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            CustomText(
                              w: FontWeight.w500,
                              text: 'Just now',
                              textColor: textMediumColor,
                            )
                          ],
                        ),
                        subtitle: const CustomText(
                          text:
                              'Look at those ears and that neck things a bruiser! I cannot imagine seeing something like that living in NJ were lucky if traffic doesn’t get anything over a few years old at least by me!',
                          isMedium: true,
                          w: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
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
      backgroundColor: Colors.indigo,
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
            controller.showMarkerInfoWindow(MarkerId("selectedLocation"));
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

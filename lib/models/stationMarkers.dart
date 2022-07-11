import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationMarkers with ChangeNotifier {
  // late BitmapDescriptor stationIcon;

  // StationMarkers() {
  //   BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(16, 16)),
  //           'assets/images/Group 892.png')
  //       .then((value) {
  //     stationIcon = value;
  //   });
  // }

  final List<Marker> _markers = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(22.6434340, 88.446740),
      infoWindow: InfoWindow(title: 'Station one'),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(22.6435442, 88.456742),
      infoWindow: InfoWindow(title: 'Station Two'),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(22.6436544, 88.466744),
      infoWindow: InfoWindow(title: 'Station Three'),
    ),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(22.6437646, 88.476746),
      infoWindow: InfoWindow(title: 'Station Three'),
    ),
    Marker(
      markerId: MarkerId('5'),
      position: LatLng(22.6438748, 88.486748),
      infoWindow: InfoWindow(title: 'Station Three'),
    )
  ];

  List<Marker> get markers {
    return [..._markers];
  }
}

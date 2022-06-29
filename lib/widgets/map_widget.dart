import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'package:location/location.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import '../utilities/constants.dart';

class MapWidget extends StatefulWidget {
  //MyFlexibleAppBar({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  // late MapmyIndiaMapController mapController;
  // static final CameraPosition _kInitialPosition = const CameraPosition(
  //   target: LatLng(28.551087, 77.257373),
  //   zoom: 14.0,
  // );
  // static const String ACCESS_TOKEN = "c9404f6161e639aaf868397cf5e89f38";
  // static const String REST_API_KEY = "c9404f6161e639aaf868397cf5e89f38";
  // static const String ATLAS_CLIENT_ID =
  //     "33OkryzDZsJ3Eeti8B8qH4oK3KqUEk1IpW5GUnHfkV85sN2QGGT5s6tUkippv26iJAbbIa8z3MxYcr6eUmzSgIedCe5fqB4R";
  // static const String ATLAS_CLIENT_SECRET =
  //     "lrFxI-iSEg-LTbCK1u10b3oQLmLXU31xS7NbhdglEIqb0LVY2d1VkPTekp2l0xh6V0OQMIjRu1Zkd-l9Kz-mc1NUGv528Y_1eXawuT9WUOc=";

  // void setPermission() async {
  //   if (!kIsWeb) {
  //     final location = Location();
  //     final hasPermissions = await location.hasPermission();
  //     if (hasPermissions != PermissionStatus.granted) {
  //       await location.requestPermission();
  //     }
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   MapmyIndiaAccountManager.setMapSDKKey(ACCESS_TOKEN);
  //   MapmyIndiaAccountManager.setRestAPIKey(REST_API_KEY);
  //   MapmyIndiaAccountManager.setAtlasClientId(ATLAS_CLIENT_ID);
  //   MapmyIndiaAccountManager.setAtlasClientSecret(ATLAS_CLIENT_SECRET);
  //   // setState(() {
  //   //   selectedFeatureType = FeatureType.MAP_EVENT;
  //   // });
  //   setPermission();
  // }

  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: mediaQuery.height * 0.6,
          // child: MapmyIndiaMap(
          //   initialCameraPosition: _kInitialPosition,
          //   onMapCreated: (map) {
          //     mapController = map;
          //     mapController.getMapmyIndiaStyle();
          //   },
          //   onMapClick: (point, latlng) => {
          //     print(latlng.toString()),
          //     // Fluttertoast.showToast(msg: latlng.toString(), toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM)
          //   },
          // ),
          child: GoogleMap(
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              newGoogleMapController = controller;
              newGoogleMapController!.setMapStyle('''
                    [
                      {
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "featureType": "administrative.locality",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#263c3f"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#6b9a76"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#38414e"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#212a37"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#9ca5b3"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#1f2835"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#f3d19c"
                          }
                        ]
                      },
                      {
                        "featureType": "transit",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#2f3948"
                          }
                        ]
                      },
                      {
                        "featureType": "transit.station",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#515c6d"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      }
                    ]
                ''');
            },
          ),
        ),
        Positioned(
          //top: 2,
          child: Padding(
            padding: EdgeInsets.only(right: 55.0, left: 55.0, top: 30.0),
            child: TextField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Destination',
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

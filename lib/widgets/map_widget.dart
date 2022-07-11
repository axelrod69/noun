import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noun_customer_app/models/stationMarkers.dart';
// import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'dart:async';
import '../utilities/constants.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import '../models/clusterPoints.dart';
import '../models/currentLocation.dart';
import 'package:provider/provider.dart';
import '../models/stationMarkers.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapWidget extends StatefulWidget {
  final Map<String, dynamic> coorDinates;
  final CameraPosition cameraPosition;

  @override
  State<MapWidget> createState() => _MapWidgetState();

  MapWidget(this.coorDinates, this.cameraPosition);
}

class _MapWidgetState extends State<MapWidget> {
  // late ClusterManager _manager;
  late double currentMapLatitude;
  late double currentMapLongitude;
  // List<Marker> markers = [];

  LatLng? latLng;
  // CameraPosition? cameraPosition;
  bool isLoading = true;

  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [];
  Set<Polyline> _polyLines = {};
  PolylinePoints? polylinePoints;
  List<LatLng> polyLineCoordinates = [];

  Set<Marker> markerOne = {};

  GoogleMapController? newGoogleMapController;

  // CameraPosition(target: LatLng(48.856613, 2.352222), zoom: 12.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    polylinePoints = PolylinePoints();
  }

  void updateMarkers(
      double latitude, double longitude, GoogleMapController controller) async {
    print('Does This get printed?');

    print('LATITUDE $latitude');
    print('LONGITUDE $longitude');

    controller = await _controller.future;

    // markers = {
    //   Marker(
    //       markerId: const MarkerId('1'), position: LatLng(latitude, longitude))
    // };

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(latitude, longitude), zoom: 18.0)));

    setState(() {});
  }

  // final CameraPosition _parisCameraPosition = cameraPosition;
  // cameraPosition = CameraPosition(target: )

  @override
  Widget build(BuildContext context) {
    // final coorDinates = Provider.of<LocationProvider>(context).coorDinates;
    markers = Provider.of<StationMarkers>(context).markers.isEmpty
        ? []
        : Provider.of<StationMarkers>(context).markers;
    final mediaQuery = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: mediaQuery.height * 0.6,
          child: GoogleMap(
            initialCameraPosition: widget.cameraPosition,
            // markers: Set<Marker>.of(markers),
            markers: Set.of(markers),
            mapType: MapType.normal,
            myLocationEnabled: true,
            polylines: _polyLines,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              // _manager.setMapId(controller.mapId);
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
              // locateUserPosition();
              updateMarkers(widget.coorDinates['lat'],
                  widget.coorDinates['lng'], controller);
              setPolyLine(widget.coorDinates['lat'], widget.coorDinates['lng']);
            },
            // onCameraMove: _manager.onCameraMove,
            // onCameraIdle: _manager.updateMap
          ),
        ),
        Positioned(
          //top: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 55.0, left: 55.0, top: 30.0),
            child: TextField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Destination',
                prefixIcon: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setPolyLine(
    double currentLatitude,
    double currentLongitude,
  ) async {
    PolylineResult result = await polylinePoints!.getRouteBetweenCoordinates(
        'AIzaSyCEOPMk8L4uOpB3OkPuNmesW_wWwDM_XB8',
        PointLatLng(currentLatitude, currentLongitude),
        const PointLatLng(22.6434340, 88.446740));

    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
        _polyLines.add(Polyline(
            width: 10,
            polylineId: PolylineId('polyLine'),
            color: Color(0xff00ffba),
            points: polyLineCoordinates));
      });
    }
  }
}

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

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mapmyindia_gl/mapmyindia_gl.dart';

import 'dart:async';
import '../utilities/constants.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import '../models/clusterPoints.dart';
import '../models/currentLocation.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class MapWidget extends StatefulWidget {
  //MyFlexibleAppBar({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late ClusterManager _manager;
  double currentMapLatitude = 0.0;
  double currentMapLongitude = 0.0;

  LatLng? latLng;
  CameraPosition? cameraPosition;
  bool isLoading = true;

  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};

  GoogleMapController? newGoogleMapController;

  // CameraPosition(target: LatLng(48.856613, 2.352222), zoom: 12.0);

  List<Place> items = [
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Place $i',
          latLng: LatLng(48.848200 + i * 0.001, 2.319124 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Restaurant $i',
          // isClosed: i % 2 == 0,
          latLng: LatLng(48.858265 - i * 0.001, 2.350107 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Bar $i',
          latLng: LatLng(48.858265 + i * 0.01, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Hotel $i',
          latLng: LatLng(48.858265 - i * 0.1, 2.350107 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test $i',
          latLng: LatLng(66.160507 + i * 0.1, -153.369141 + i * 0.1)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test2 $i',
          latLng: LatLng(-36.848461 + i * 1, 169.763336 + i * 1)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _manager = _initClusterManager();
    Provider.of<LocationProvider>(context, listen: false)
        .getLocation()
        .then((_) {
      setState(() {
        isLoading = false;
        // currentMapLatitude =
        //     Provider.of<LocationProvider>(context, listen: false)
        //         .currentLatitude;
        // currentMapLongitude =
        //     Provider.of<LocationProvider>(context, listen: false)
        //         .currentLongitude;
      });
    });
    currentMapLatitude =
        Provider.of<LocationProvider>(context, listen: false).currentLatitude;
    currentMapLongitude =
        Provider.of<LocationProvider>(context, listen: false).currentLongitude;
    latLng = LatLng(currentMapLatitude, currentMapLongitude);
    cameraPosition = CameraPosition(target: latLng!, zoom: 18.0);
    // newGoogleMapController?.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(target: latLng!, zoom: 12.0)));
    super.initState();
  }

  locateUserPosition() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    LatLng latLngPosition =
        LatLng(currentPosition.latitude, currentPosition.longitude);

    CameraPosition newCameraPosition =
        CameraPosition(target: latLngPosition, zoom: 18.0);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  }

  // final CameraPosition _parisCameraPosition = cameraPosition;
  // cameraPosition = CameraPosition(target: )

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(items, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    print('Updated ${markers.length} markers');
    setState(() {
      this.markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Color(0xff00ffba),
            ),
          )
        : Stack(
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
                  initialCameraPosition: cameraPosition!,
                  markers: markers,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    _manager.setMapId(controller.mapId);
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
                    locateUserPosition();
                  },
                  // onCameraMove: _manager.onCameraMove,
                  // onCameraIdle: _manager.updateMap
                ),
              ),
              Positioned(
                //top: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 55.0, left: 55.0, top: 30.0),
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

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            print('---- $cluster');
            cluster.items.forEach((p) => print(p));
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 80 : 50,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.orange;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}


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

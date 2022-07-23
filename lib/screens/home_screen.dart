import 'package:flutter/material.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:noun_customer_app/screens/changeAddressInput.dart';
import 'package:provider/provider.dart';
import '../utilities/constants.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/map_widget.dart';
import '../models/currentLocation.dart';

class HomeScreen extends StatefulWidget {
  //HomeScreen({Key? key}) : super(key: key);
  static const id = 'homeScreen';

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  CameraPosition? cameraPosition;
  LatLng? latLng;
  bool isLoading = true;
  late ClusterManager _manager;
  late double currentMapLatitude;
  late double currentMapLongitude;

  @override
  void initState() {
    // TODO: implement initState
    // _manager = _initClusterManager();
    Provider.of<LocationProvider>(context, listen: false)
        .getLocation()
        .then((_) {
      setState(() {
        print('Value Of isLoading: ${isLoading}');
        isLoading = false;
      });
    });

    currentMapLatitude = Provider.of<LocationProvider>(context, listen: false)
        .coorDinates['lat'];

    currentMapLongitude = Provider.of<LocationProvider>(context, listen: false)
        .coorDinates['lng'];

    print('At Home Screen');
    print('LAT LONGGGGGG');
    print('Current Position Latitude: $currentMapLatitude');
    print('Current Position Longitude: $currentMapLongitude');

    latLng = LatLng(currentMapLatitude, currentMapLongitude);

    print('Latitude Longitude: $latLng');

    cameraPosition = CameraPosition(target: latLng!, zoom: 18.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider =
        Provider.of<LocationProvider>(context).deliveryAddress;
    final mediaQuery = MediaQuery.of(context);
    final coorDinates = Provider.of<LocationProvider>(context).coorDinates;

    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: kScaffoldBackgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SelectAddress())),
          child: const Icon(
            Icons.gps_fixed,
            size: 15.0,
          ),
        ),
        title: Container(
          width: double.infinity,
          height: mediaQuery.size.height * 0.025,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              addressProvider,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : MapWidget(coorDinates, cameraPosition!),
          DraggableScrollableSheet(
            initialChildSize: 0.34,
            minChildSize: 0.34,
            builder: (context, controller) => Container(
              color: kScaffoldBackgroundColor,
              child: SingleChildScrollView(
                controller: controller,
                child: Container(
                  // color: Colors.amber,
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Column(
                    children: [
                      CarouselWidget(
                          mediaQuery: mediaQuery,
                          text: 'Stations Near Me',
                          isVideo: false),
                      SizedBox(
                        height: mediaQuery.size.height * 0.05,
                      ),
                      CarouselWidget(
                          mediaQuery: mediaQuery,
                          text: 'Favourite',
                          isVideo: false),
                      SizedBox(
                        height: mediaQuery.size.height * 0.05,
                      ),
                      Container(
                        height: mediaQuery.size.height * 0.2,
                        width: double.infinity,
                        // padding: EdgeInsets.symmetric(vertical: 0, horizontal: .0),
                        decoration: const BoxDecoration(
                          //color: Colors.amber,
                          image: DecorationImage(
                            image: AssetImage('assets/images/offer.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '30% OFF On First Charge',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.05,
                      ),
                      // CarouselWidget(
                      //     mediaQuery: mediaQuery, text: 'Video', isVideo: true),
                      // SizedBox(
                      //   height: mediaQuery.size.height * 0.2,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // body: NestedScrollView(
      //   headerSliverBuilder: (context, innerBoxIsScrolled) => [
      //     SliverAppBar(
      //       flexibleSpace: FlexibleSpaceBar(
      //         // centerTitle: true,
      //         // title: Text("$title",
      //         //     style: TextStyle(
      //         //       color: Colors.white,
      //         //       fontSize: 16.0,
      //         //     ) //TextStyle
      //         //     ), //Text
      //         background: MyFlexibleAppBar(),
      //       ), //Fl
      //       backgroundColor: Colors.grey[800],
      //       expandedHeight: mediaQuery.size.height * 0.6,
      //       leading: Icon(
      //         Icons.gps_fixed,
      //         size: 15.0,
      //       ),
      //       title: Text(
      //         '123/85 Park Street, Kolkata 700016',
      //         style: TextStyle(fontSize: 13.0),
      //       ),
      //     ),
      //   ],
      //   body: SingleChildScrollView(
      //     child: Container(
      //       // color: Colors.amber,
      //       padding: EdgeInsets.only(top: 35.0),
      //       child: Column(
      //         children: [
      //           CarouselWidget(
      //               mediaQuery: mediaQuery,
      //               text: 'Stations Near Me',
      //               isVideo: false),
      //           SizedBox(
      //             height: mediaQuery.size.height * 0.05,
      //           ),
      //           CarouselWidget(
      //               mediaQuery: mediaQuery, text: 'Favourite', isVideo: false),
      //           SizedBox(
      //             height: mediaQuery.size.height * 0.05,
      //           ),
      //           Container(
      //             height: mediaQuery.size.height * 0.2,
      //             width: double.infinity,
      //             // padding: EdgeInsets.symmetric(vertical: 0, horizontal: .0),
      //             decoration: const BoxDecoration(
      //               //color: Colors.amber,
      //               image: DecorationImage(
      //                 image: AssetImage('assets/images/offer.png'),
      //                 fit: BoxFit.cover,
      //               ),
      //             ),
      //             child: Center(
      //               child: Text(
      //                 '30% OFF On First Charge',
      //                 textAlign: TextAlign.center,
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: mediaQuery.size.height * 0.05,
      //           ),
      //           CarouselWidget(
      //               mediaQuery: mediaQuery, text: 'Video', isVideo: true),
      //           SizedBox(
      //             height: mediaQuery.size.height * 0.2,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

//import 'dart:html';

import 'package:flutter/material.dart';

import 'dart:ui';
import '../utilities/constants.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/map_widget.dart';

class HomeScreen extends StatefulWidget {
  //HomeScreen({Key? key}) : super(key: key);
  static const id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: kScaffoldBackgroundColor,
        elevation: 0,
        leading: const Icon(
          Icons.gps_fixed,
          size: 15.0,
        ),
        title: const Text(
          '123/85 Park Street, Kolkata 700016',
          style: TextStyle(fontSize: 13.0),
        ),
      ),
      body: Stack(
        children: [
          MapWidget(),
          DraggableScrollableSheet(
            initialChildSize: 0.34,
            minChildSize: 0.34,
            builder: (context, controller) => Container(
              color: kScaffoldBackgroundColor,
              child: SingleChildScrollView(
                controller: controller,
                child: Container(
                  // color: Colors.amber,
                  padding: EdgeInsets.only(top: 35.0),
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
                      CarouselWidget(
                          mediaQuery: mediaQuery, text: 'Video', isVideo: true),
                      SizedBox(
                        height: mediaQuery.size.height * 0.2,
                      ),
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

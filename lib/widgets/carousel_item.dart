import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../screens/station_details_screen.dart';

class CarouselItem extends StatelessWidget {
  //const CarouselItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 500,
      margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(0xff1f1f1f),
        //color: Colors.blue,
        boxShadow: [
          const BoxShadow(
            color: Color(0xff00ffba),
            offset: Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 0.5,
          ),
          const BoxShadow(
            color: Colors.black,
            offset: Offset(-4, -4),
            blurRadius: 10,
          )
        ],
      ),
      child: ListView(
        children: [
          Row(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  //color: Colors.amber,
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lightning bolt'),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '4.5(8)',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 10.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Open now',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 10.0),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/Group 1621.png'),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text('Cafe'),
                            ],
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/tree.png',
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text('Park'),
                            ],
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/distance.png'),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text('400m'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                    padding: EdgeInsets.all(5.0),
                    child: Text('data'),
                  )),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Group 892.png',
                            height: 45.0,
                          ),
                          Column(
                            children: [
                              Text(
                                'Ac-Type 1',
                                style: TextStyle(fontSize: 10.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '50kw',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Group 892.png',
                            height: 45.0,
                          ),
                          Column(
                            children: [
                              Text(
                                'Ac-Type 1',
                                style: TextStyle(fontSize: 10.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '50kw',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 5.0,
                      // ),
                      Container(
                        // color: Colors.amber,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.09,
                              width: MediaQuery.of(context).size.width * 0.25,
                              // color: Colors.red,
                              padding: EdgeInsets.only(
                                top: 20.0,
                                right: 5.0,
                              ),
                              child: Button(
                                'BOOK',
                                () {
                                  Timer(
                                      const Duration(milliseconds: 500),
                                      () => Navigator.pushNamed(
                                            context,
                                            StationDetailsScreen.id,
                                          ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

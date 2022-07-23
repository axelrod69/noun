import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';

import '../widgets/small_container.dart';
import 'booking_screen.dart';
import './slot_booking_screen.dart';
import './select_money_charge_screen.dart';

class StationDetailsScreen extends StatefulWidget {
  //const StationDetailsScreen({Key? key}) : super(key: key);
  static const id = 'station_details_screen';

  @override
  State<StationDetailsScreen> createState() => _StationDetailsScreenState();
}

class _StationDetailsScreenState extends State<StationDetailsScreen> {
  var _isElevated = true;

  Widget _createIOSdialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Select Charging Option'),
      actions: [
        CupertinoDialogAction(
          child: Text('Slot Booking'),
          onPressed: () {},
        ),
        CupertinoDialogAction(
          child: Text('By Charge'),
          onPressed: () {},
        ),
        CupertinoDialogAction(
          child: Text('By Price'),
          onPressed: () {},
        ),
      ],
    );
  }

  void _showSimpleDialog(BuildContext context) => showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            // backgroundColor: Colors.grey.withOpacity(0.8),
            title: Text('Select Charging Option'),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                onPressed: () {
                  Navigator.pushNamed(
                      context, SlotBookingScreen.id); //change done
                },
                child: Text('Slot Booking'),
              ),
              SimpleDialogOption(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                onPressed: () {
                  Navigator.pushNamed(context, MoneyAndChargeScreen.id);
                },
                child: Text('Booking By Charging'),
              ),
              SimpleDialogOption(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                onPressed: () {
                  Navigator.pushNamed(context, BookingScreen.id);
                },
                child: Text('Booking By Price'),
              )
            ],
          ));

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mediaQuery.size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lightning Bolt',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(
                        'Open now',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 15.0,
                      ),
                      SizedBox(
                        width: mediaQuery.size.width * 0.02,
                      ),
                      Text('4.5(8)'),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.05,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          // height: 30.0,
                          //color: Colors.amber,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        '81/2 Salt Lake, Sector V, Kolkata-700052',
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: mediaQuery.size.height * 0.05,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.,
                                children: [
                                  SmallConatiner(
                                    text: 'Cafe',
                                    imgpath: 'assets/images/Group 1621.png',
                                    color: kScaffoldBackgroundColor,
                                    forContainerForBookAndPay: false,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  SmallConatiner(
                                    text: 'Park',
                                    imgpath: 'assets/images/tree.png',
                                    color: kScaffoldBackgroundColor,
                                    forContainerForBookAndPay: false,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: mediaQuery.size.height * 0.05,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          // color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset('assets/images/map.png'),
                              SizedBox(
                                height: mediaQuery.size.height * 0.02,
                              ),
                              //Button('Location', () {})
                              Listener(
                                onPointerUp: (_) =>
                                    setState(() => _isElevated = true),
                                onPointerDown: (_) {
                                  setState(() {
                                    _isElevated = false;

                                    //_isElevated = false;
                                  });
                                  () {};
                                  // Timer(const Duration(milliseconds: 10000), widget.onPressed());
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 35.0),
                                  decoration: BoxDecoration(
                                      color: kScaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: _isElevated == true
                                          ? [
                                              BoxShadow(
                                                color: Color(0xff1b1e2b),
                                                offset: Offset(-5, -5),
                                                blurRadius: 5,
                                              ),
                                              BoxShadow(
                                                color: Color(0xff07080b),
                                                offset: Offset(5, 5),
                                                blurRadius: 5,
                                              ),
                                            ]
                                          : null),
                                  child: Text(
                                    'Locate',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.08,
                  ),
                  Platform.isIOS
                      ? CupertinoButton(
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            'BOOK',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15.0),
                          ),
                          onPressed: () {
                            showCupertinoDialog(
                                context: context, builder: _createIOSdialog);
                          })
                      : TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 150.0),
                          ),
                          // onPressed: () {
                          //   Navigator.pushNamed(context, BookingScreen.id);
                          // },
                          onPressed: () => _showSimpleDialog(context),
                          child: Text(
                            'BOOK',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15.0),
                          ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

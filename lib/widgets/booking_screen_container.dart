import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noun_customer_app/screens/slot_booking_screen.dart';
import '../utilities/constants.dart';
import 'small_container.dart';
import 'button.dart';
import '../screens/payment_screen.dart';

class BookingScreenContainer extends StatefulWidget {
  @override
  State<BookingScreenContainer> createState() => _BookingScreenContainerState();
}

class _BookingScreenContainerState extends State<BookingScreenContainer> {
  late final _time = DateFormat.Hm().format(DateTime.now());
  late final _date = DateFormat.yMd().format(DateTime.now());
  late TimeOfDay _convertedTime;
  late DateTime _convertedDate;

  TimeOfDay _stringToTimeOfDay(String tod) {
    final format = DateFormat.Hm();
    return TimeOfDay.fromDateTime(format.parse(tod));
  }

  DateTime _stringToDateTime(String tod) {
    // this the method for converting string to DateTime
    final format = DateFormat.yMd();
    return DateFormat.yMd().parse(tod);
  }

  @override
  void initState() {
    _convertedTime = _stringToTimeOfDay(_time);
    _convertedDate = _stringToDateTime(_date);
    super.initState();
  }

  // return TimeOfDay.fromDateTime(format.parse(tod));

  @override
  Widget build(BuildContext context) {
    final hours = _convertedTime.hour.toString().padLeft(2, '0');
    final minutes = _convertedTime.minute.toString().padLeft(2, '0');
    print('time: $_time');
    print('date: $_date'); //this is the current time

    // convertedTime = _stringToTimeOfDay(_time);

    print('convertedTime: $_convertedTime');
    print('convrted-date: $_convertedDate');

    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: mediaQuery.height * 0.02),
      decoration: kBookAndPayContainer,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lightning Bolt Charging Station',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.02,
                        ),
                        Row(
                          children: [
                            SmallConatiner(
                              text: 'Cafe',
                              imgpath: 'assets/images/Group 1621.png',
                              color: Theme.of(context).colorScheme.secondary,
                              forContainerForBookAndPay: true,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            SmallConatiner(
                              text: 'Park',
                              imgpath: 'assets/images/tree.png',
                              color: Theme.of(context).colorScheme.secondary,
                              forContainerForBookAndPay: true,
                            ),
                          ],
                        )
                      ],
                    ),
                    VerticalDivider(
                      color: Theme.of(context).primaryColor,
                      width: 20,
                      thickness: 2,
                      // indent: 20,
                      // // endIndent: 0,
                    ),
                    Container(
                      width: mediaQuery.width * 0.22,
                      height: mediaQuery.height * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                        image: DecorationImage(
                          image: AssetImage('assets/images/back.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            SizedBox(
              height: mediaQuery.height * 0.01,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Time',
            //         style: TextStyle(fontWeight: FontWeight.bold),
            //       ),
            //       ElevatedButton(
            //         onPressed: () async {
            //           TimeOfDay? newTime = await showTimePicker(
            //             context: context,
            //             initialTime: _convertedTime,
            //           );
            //           if (newTime == null) return;

            //           setState(() {
            //             _convertedTime = newTime;
            //           });
            //         },
            //         child: Text(
            //           "$hours:$minutes",
            //           style: TextStyle(fontWeight: FontWeight.bold),
            //         ),
            //         style: ElevatedButton.styleFrom(
            //           primary: Theme.of(context).colorScheme.secondary,
            //           padding: EdgeInsets.symmetric(
            //               vertical: 10.0, horizontal: 50.0),
            //           elevation: 20.0,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: mediaQuery.height * 0.001,
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: _convertedDate,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (newDate == null) return;

                      setState(() {
                        _convertedDate = newDate;
                      });
                    },
                    child: Text(
                      '${_convertedDate.day}/${_convertedDate.month}/${_convertedDate.year}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 50.0),
                      elevation: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.001,
            ),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Power', style: TextStyle(fontWeight: FontWeight.bold)),
            //       Container(
            //         width: 150,
            //         child: TextField(
            //           textAlign: TextAlign.center,
            //           onChanged: (value) {},
            //           decoration: InputDecoration(
            //             hintText: '10KmH',
            //             focusedBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: Theme.of(context).primaryColor,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(
              height: mediaQuery.height * 0.001,
            ),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Power', style: TextStyle(fontWeight: FontWeight.bold)),
            //       Container(
            //         width: 150,
            //         child: TextField(
            //           textAlign: TextAlign.center,
            //           onChanged: (value) {},
            //           decoration: InputDecoration(
            //             hintText: '10KmH',
            //             focusedBorder: OutlineInputBorder(
            //               borderSide: BorderSide(
            //                 color: Theme.of(context).primaryColor,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: mediaQuery.height * 0.01,
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Button('Continue', () {
              Timer(const Duration(milliseconds: 500),
                  () => Navigator.pushNamed(context, SlotBookingScreen.id));
            }),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

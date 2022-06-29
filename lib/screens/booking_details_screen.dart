import 'package:flutter/material.dart';

import '../widgets/booking_details_container.dart';
import '../utilities/constants.dart';

class BookingDetails extends StatelessWidget {
  //const BookingDetails({Key? key}) : super(key: key);
  static const id = 'booking_details';
  final String date;
  final String stationName;
  final String time;
  BookingDetails(
      {required this.date, required this.stationName, required this.time});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Booking Details',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: mediaQuery.height * 0.09,
            horizontal: mediaQuery.width * 0.05),
        child: BookingDetailsContainer(),
      ),
    );
  }
}

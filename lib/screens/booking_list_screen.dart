import 'package:flutter/material.dart';

import '../utilities/constants.dart';

import '../widgets/booking_list_item.dart';

class BookingListScreen extends StatelessWidget {
  //const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: kScaffoldBackgroundColor,
        title: Text('Booking List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return BookingListItem();
          },
          itemCount: 5,
        ),
      ),
    );
  }
}

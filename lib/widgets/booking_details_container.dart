import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noun_customer_app/screens/payment_screen.dart';

import '../utilities/constants.dart';
import 'button.dart';

class BookingDetailsContainer extends StatelessWidget {
  // const BookingDetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: mediaQuery.height * 0.02),
      decoration: kBookAndPayContainer,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Lightning Bolt Charging Station',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: mediaQuery.height * 0.002,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                    child: Center(
                      child: Text(
                        '9/5/2022',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: mediaQuery.height * 0.001,
            // ),
            SizedBox(
              height: mediaQuery.height * 0.002,
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                    child: Center(
                      child: Text(
                        '9:30 AM',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Button('Continue', () {
              // Timer(const Duration(milliseconds: 500),
              //     () => Navigator.pushNamed(context, PaymentScreen.id));
              Timer(const Duration(milliseconds: 500),
                  () => Navigator.pushNamed(context, PaymentScreen.id));
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

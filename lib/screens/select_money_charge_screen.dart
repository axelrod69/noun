import 'package:flutter/material.dart';
import 'package:noun_customer_app/utilities/constants.dart';
import '../widgets/money_charge_container.dart';

class MoneyAndChargeScreen extends StatelessWidget {
  //const BookingScreen({Key? key}) : super(key: key);
  static const id = 'money_charge_container';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Booking',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: mediaQuery.height * 0.09,
            horizontal: mediaQuery.width * 0.05),
        child: MoneyChargeContainer(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../widgets/payment_screen_container.dart';

class PaymentScreen extends StatelessWidget {
  //const PaymentScreen({Key? key}) : super(key: key);
  static const id = 'payment_screen';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Payment',
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22.0, right: 15.0, left: 15.0),
        child: PaymentScreenContainer(),
      ),
    );
  }
}

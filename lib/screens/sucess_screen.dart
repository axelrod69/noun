import 'package:flutter/material.dart';
import 'package:noun_customer_app/utilities/constants.dart';
import 'home_screen.dart';
import '../widgets/bottom_navigation_bar.dart';

class SuccessScreen extends StatelessWidget {
  //const SuccessScreen({Key? key}) : super(key: key);
  static const id = 'success_screen';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/done2.gif'),
              //color: Colors.transparent,
            ),
            Text(
              'Your payment was done successfully',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 150.0),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, BottomNavigation.id);
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15.0),
                ))
          ],
        ),
      ),
    );
  }
}

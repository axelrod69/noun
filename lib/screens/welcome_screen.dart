import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/button.dart';
import 'signup_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  //const WelcomeScreen({Key? key, required this.title}) : super(key: key);
  static const id = 'WelcomeScreen';
  // final String title;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 45.0,
                ),
                Button('LOGIN', () {
                  Timer(const Duration(milliseconds: 1000),
                      () => Navigator.pushNamed(context, LoginScreen.id));
                }

                    // () => Navigator.pushNamed(context, LoginScreen.id)
                    ),
                const SizedBox(
                  height: 45.0,
                ),
                Button(
                  'SIGNUP',
                  () {
                    Timer(const Duration(milliseconds: 1000),
                        () => Navigator.pushNamed(context, SignupScreen.id));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

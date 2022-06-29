//import 'dart:html';

import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  //const IntroScreen({Key? key}) : super(key: key);
  final String backgroundImg;
  final String heroImg;
  final String title;
  final String description;
  final VoidCallback onPressed;

  IntroScreen(
      {required this.backgroundImg,
      required this.description,
      required this.heroImg,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: mediaQuery.height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              heroImg,
              height: mediaQuery.height * 0.2,
            ),
            SizedBox(
              height: mediaQuery.height * 0.10,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
              child: Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.20,
            ),
            // ElevatedButton(onPressed: () {}, child: Text('Next'))
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: TextButton(
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: mediaQuery.width * 0.030,
                    ),
                    Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    SizedBox(
                      width: mediaQuery.width * 0.005,
                    ),
                    Image.asset('assets/images/Group 1969.png')
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

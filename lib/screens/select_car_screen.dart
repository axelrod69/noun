import 'dart:async';

import 'package:flutter/material.dart';
import 'package:noun_customer_app/utilities/constants.dart';

import '../widgets/dropdown_widget.dart';
import '../widgets/button.dart';
import '../widgets/bottom_navigation_bar.dart';

class SelectCarScreen extends StatefulWidget {
  // SelectCarScreen({Key? key}) : super(key: key);
  static const id = 'select_car_screen';

  @override
  State<SelectCarScreen> createState() => _SelectCarScreenState();
}

class _SelectCarScreenState extends State<SelectCarScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: kScaffoldBackgroundColor,
        title: Text('Select Your Car'),
      ),
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: mediaQuery.height * 0.05,
            // ),
            Image.asset(
              'assets/images/demo_car.png',
              height: 120,
            ),
            SizedBox(
              height: mediaQuery.height * 0.08,
            ),
            DropDownWidget(
              dataList: ['BMW', 'Porsche', 'Audi', 'Lamborghini'],
              text: 'Brand',
            ),
            SizedBox(
              height: mediaQuery.height * 0.06,
            ),
            DropDownWidget(
              dataList: ['BMW', 'Porsche', 'Audi', 'Lamborghini'],
              text: 'Model',
            ),
            SizedBox(
              height: mediaQuery.height * 0.06,
            ),
            DropDownWidget(
              dataList: ['BMW', 'Porsche', 'Audi', 'Lamborghini'],
              text: 'Model',
            ),
            SizedBox(
              height: mediaQuery.height * 0.06,
            ),
            DropDownWidget(
              dataList: [
                'AC',
                'DC',
              ],
              text: 'Charger Type',
            ),
            SizedBox(
              height: mediaQuery.height * 0.06,
            ),
            DropDownWidget(
              dataList: [
                'EV',
                'CCS2',
              ],
              text: 'Port type',
            ),
            SizedBox(
              height: mediaQuery.height * 0.09,
            ),
            // Button('Save', () {
            //   Timer(const Duration(milliseconds: 500),
            //       () => Navigator.pushNamed(context, BottomNavigation.id));
            // }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Button('SAVE', () {
                Timer(const Duration(milliseconds: 500),
                    () => Navigator.pushNamed(context, BottomNavigation.id));
              }),
            ),
            SizedBox(
              height: mediaQuery.height * 0.06,
            )
          ],
        ),
      ),
    );
  }
}

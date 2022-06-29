import 'package:flutter/material.dart';
import './screens/welcome_screen.dart';
import './screens/signup_screen.dart';
import './screens/login_screen.dart';
import './screens/onboarding_screen.dart';
import './screens/home_screen.dart';
import './widgets/bottom_navigation_bar.dart';
import './screens/station_details_screen.dart';
import './screens/booking_screen.dart';
import './screens/payment_screen.dart';
import './screens/sucess_screen.dart';
import './screens/otp_screen.dart';
import './screens/select_car_screen.dart';
import './screens/slot_booking_screen.dart';
import './screens/booking_details_screen.dart';
import './screens/select_money_charge_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        // primarySwatch: Colors.blue,
        primaryColor: Color(0xff00ffba),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff1f1f1f),
        ),
      ),
      home: OnboardingScreen(),
      routes: {
        SignupScreen.id: (context) => SignupScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        BottomNavigation.id: (context) => BottomNavigation(),
        StationDetailsScreen.id: (context) => StationDetailsScreen(),
        BookingScreen.id: (context) => BookingScreen(),
        PaymentScreen.id: (context) => PaymentScreen(),
        SuccessScreen.id: (context) => SuccessScreen(),
        OtpScreen.id: (context) => OtpScreen(),
        SelectCarScreen.id: (context) => SelectCarScreen(),
        SlotBookingScreen.id: (context) => SlotBookingScreen(),
        MoneyAndChargeScreen.id: (context) => MoneyAndChargeScreen(),
        // BookingDetails.id: (context) => BookingDetails(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

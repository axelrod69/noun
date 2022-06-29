import 'package:flutter/material.dart';
import '../screens/booking_details_screen.dart';
import '../screens/slot_booking_screen.dart';
// import 'package:noun_customer_app/screens/payment_screen.dart';
// import '../screens/booking_screen.dart';

class SloWidget extends StatefulWidget {
  final customFunction;
  final slotTime;
  final slotNumber;
  SloWidget({required this.customFunction, this.slotNumber, this.slotTime});

  @override
  State<SloWidget> createState() => _SloWidgetState();
}

class _SloWidgetState extends State<SloWidget> {
  // const SloWidget({Key? key}) : super(key: key);
  var _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          elevation: 20.0,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)),
      onPressed: () {
        setState(() {
          _isPressed = !_isPressed;
        });
        widget.customFunction(true);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Time',
                style: (_isPressed == true)
                    ? TextStyle(color: Colors.grey)
                    : TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Text(
                '9-9:30',
                style: (_isPressed == true)
                    ? TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                    : TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            width: 30.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Slot 01',
                style: (_isPressed == true)
                    ? TextStyle(color: Colors.grey)
                    : TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10.0),
              (_isPressed == true)
                  ? Flexible(
                      fit: FlexFit.loose,
                      child: Image.asset(
                        'assets/images/imagesRed.png',
                        width: 80.0,
                        height: 50.0,
                      ),
                    )
                  : Flexible(
                      fit: FlexFit.loose,
                      child: Image.asset(
                        'assets/images/imagesGreen.png',
                        width: 80.0,
                        height: 50.0,
                      ),
                    )
              // Image.asset(
              //   'assets/images/imagesRed.png',
              //   width: 80.0,
              //   height: 50.0,
              // )
            ],
          )
        ],
      ),
    );
  }
}

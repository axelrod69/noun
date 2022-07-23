import 'package:flutter/material.dart';
import 'package:noun_customer_app/utilities/constants.dart';

class SmallConatiner extends StatelessWidget {
  //const SmallConatiner({Key? key}) : super(key: key);
  final String text;
  final String imgpath;
  final Color color;
  final bool forContainerForBookAndPay;
  SmallConatiner(
      {required this.text,
      required this.imgpath,
      required this.color,
      required this.forContainerForBookAndPay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: (forContainerForBookAndPay == false)
                  ? Color(0xff1b1e2b)
                  : Color(0xff242424),
              offset: Offset(-2, -2), //change done
              blurRadius: 3, //change done
            ),
            BoxShadow(
              color: (forContainerForBookAndPay == false)
                  ? Color(0xff07080b)
                  : Color(0xff1a1a1a),
              offset: Offset(2, 2), //change done
              blurRadius: 3, //change done
            ),
          ]),
      child: Row(
        children: [
          Image.asset(imgpath),
          SizedBox(
            width: 5.0,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

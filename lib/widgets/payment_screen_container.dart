import 'package:flutter/material.dart';
import 'package:noun_customer_app/widgets/button.dart';

import '../utilities/constants.dart';
import '../screens/sucess_screen.dart';

class PaymentScreenContainer extends StatefulWidget {
  @override
  State<PaymentScreenContainer> createState() => _PaymentScreenContainerState();
}

class _PaymentScreenContainerState extends State<PaymentScreenContainer> {
  //const PaymentScreenContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: mediaQuery.height * 0.02),
      decoration: kBookAndPayContainer,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1.5, color: Theme.of(context).primaryColor),
                ),
              ),
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '13kw Charge',
                        // style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Service Charge',
                        // style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'CGST',
                        // style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'SGST',
                        // style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: Theme.of(context).primaryColor,
                          thickness: 1.5,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Text('₹ 250'),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text('₹ 250'),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text('₹ 25'),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text('₹ 24'),
                            SizedBox(
                              height: 15.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: mediaQuery.height * 0.01,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.5,
                    ),
                  )),
                  child: Text(
                    '₹ 540',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Payment Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: Column(
                children: List.generate(
                  checkListItems.length,
                  (index) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(
                      checkListItems[index]['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: checkListItems[index]["value"],
                    onChanged: (value) {
                      setState(() {
                        for (var element in checkListItems) {
                          element["value"] = false;
                        }
                        checkListItems[index]["value"] = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.01,
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Button('Pay', () {
              Navigator.pushNamed(context, SuccessScreen.id);
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

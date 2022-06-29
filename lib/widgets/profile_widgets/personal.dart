import 'package:flutter/material.dart';
import 'package:noun_customer_app/widgets/chart_widget.dart';

class Personal extends StatefulWidget {
  //Personal({Key? key}) : super(key: key);

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: mediaQuery.height * 0.01,
          ),
          Container(
            // color: Colors.amber,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: mediaQuery.width * 0.12,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Theme.of(context).primaryColor,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: mediaQuery.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanay Banerjee',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.01,
                    ),
                    Text('somewhat@somewhere.com')
                  ],
                ),
                SizedBox(
                  width: mediaQuery.width * 0.1,
                ),
                IconButton(
                  onPressed: () {
                    print('clicked');
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: mediaQuery.height * 0.1,
          ),
          Container(height: mediaQuery.height * 0.3, child: MyChartWidget()),
          SizedBox(
            height: mediaQuery.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
            child: Row(
              children: [
                Text(
                  'My Car',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

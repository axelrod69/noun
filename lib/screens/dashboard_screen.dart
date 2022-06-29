import 'package:flutter/material.dart';

import '../utilities/constants.dart';

import '../widgets/chart_widget.dart';
import '../widgets/profile_widgets/personal.dart';

class DashboardScreen extends StatelessWidget {
  //const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: kScaffoldBackgroundColor,
        title: Text('Dashboard'),
      ),
      body: Personal(),
    );
  }
}

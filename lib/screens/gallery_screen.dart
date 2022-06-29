import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../widgets/carousel_widget.dart';

class GalleryScreen extends StatelessWidget {
  //const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: kScaffoldBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: kScaffoldBackgroundColor,
          title: Text('Gallery'),
        ),
        body: Column(
          children: [
            CarouselWidget(
                mediaQuery: mediaQuery, text: 'Video', isVideo: true),
            SizedBox(
              height: mediaQuery.size.height * 0.1,
            ),
            CarouselWidget(
                mediaQuery: mediaQuery, text: 'Images', isVideo: true),
          ],
        ));
  }
}

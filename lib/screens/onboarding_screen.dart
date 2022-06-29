import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_screen.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  //OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              IntroScreen(
                  backgroundImg: 'assets/images/background.png',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend, quam sed euismod vulputate, augue velit gravida purus, quis euismod velit risus at feli',
                  heroImg: 'assets/images/Group 1967.png',
                  title: 'Lorem ipsum',
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  }),
              IntroScreen(
                backgroundImg: 'assets/images/background.png',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend, quam sed euismod vulputate, augue velit gravida purus, quis euismod velit risus at feli',
                heroImg: 'assets/images/EV 3.png',
                title: 'Lorem ipsum',
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
              ),
              IntroScreen(
                  backgroundImg: 'assets/images/background.png',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend, quam sed euismod vulputate, augue velit gravida purus, quis euismod velit risus at feli',
                  heroImg: 'assets/images/EV 2.png',
                  title: 'Lorem ipsum',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
            ],
          ),
          Positioned(
            top: mediaQuery.size.height * 0.40,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.white,
                  dotHeight: 9.0,
                  dotWidth: 9.0,
                  activeDotColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

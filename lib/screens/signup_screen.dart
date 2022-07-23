import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/button.dart';
import '../utilities/constants.dart';
import '../widgets/button.dart';

class SignupScreen extends StatefulWidget {
  //LoginScreen({Key? key}) : super(key: key);
  static const id = 'SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: SafeArea(
                child: ListView(
                  children: [
                    ListTile(
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Signup',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          _buildListTile('Name'),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  offset: Offset(0, 0),
                                  color: Color(0xff00ffba),
                                ),
                                BoxShadow(
                                  blurRadius: 10.0, //Change done
                                  offset: Offset(-5, -5), //Change done
                                  color: Colors.black,
                                ),
                                BoxShadow(
                                  blurRadius: 3.0, //Change done
                                  offset: Offset(-1, -1),
                                  color: Colors.black,
                                )
                              ],
                            ),
                            child: TextField(
                              onChanged: (value) {},
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Your Name'),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          _buildListTile('Password'),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0, //Change done
                                  offset: Offset(0, 0),
                                  color: Color(0xff00ffba),
                                ),
                                BoxShadow(
                                  blurRadius: 10.0, //Change done
                                  offset: Offset(-5, -5), //Change done
                                  color: Colors.black,
                                ),
                                BoxShadow(
                                  blurRadius: 3.0, //Change done
                                  offset: Offset(-1, -1),
                                  color: Colors.black,
                                )
                              ],
                            ),
                            child: TextField(
                              onChanged: (value) {},
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Type Password'),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          _buildListTile('Address'),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0, //Change done
                                  offset: Offset(0, 0),
                                  color: Color(0xff00ffba),
                                ),
                                BoxShadow(
                                  blurRadius: 10.0, //Change done
                                  offset: Offset(-5, -5), //Change done
                                  color: Colors.black,
                                ),
                                BoxShadow(
                                  blurRadius: 3.0, //Change done
                                  offset: Offset(-1, -1),
                                  color: Colors.black,
                                )
                              ],
                            ),
                            child: TextField(
                              onChanged: (value) {},
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Your Address'),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          _buildListTile('Phone Number'),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0, //Change done
                                  offset: Offset(0, 0),
                                  color: Color(0xff00ffba),
                                ),
                                BoxShadow(
                                  blurRadius: 10.0, //Change done
                                  offset: Offset(-5, -5), //Change done
                                  color: Colors.black,
                                ),
                                BoxShadow(
                                  blurRadius: 3.0, //Change done
                                  offset: Offset(-1, -1),
                                  color: Colors.black,
                                )
                              ],
                            ),
                            child: TextField(
                              onChanged: (value) {},
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Your Number'),
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          _buildListTile('Email ID'),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0, //Change done
                                  offset: Offset(0, 0),
                                  color: Color(0xff00ffba),
                                ),
                                BoxShadow(
                                  blurRadius: 10.0, //Change done
                                  offset: Offset(-5, -5), //Change done
                                  color: Colors.black,
                                ),
                                BoxShadow(
                                  blurRadius: 3.0, //Change done
                                  offset: Offset(-1, -1),
                                  color: Colors.black,
                                )
                              ],
                            ),
                            child: TextField(
                              onChanged: (value) {},
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Your Email ID'),
                            ),
                          ),
                          const SizedBox(
                            height: 65.0,
                          ),
                          Button('SIGNUP', () {}),
                          const SizedBox(
                            height: 35.0,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Already Have an account? ',
                              //style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 45.0,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String text) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 35.0),
      leading: Text(
        text,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
      ),
    );
  }
}

import 'package:you_chat/screen_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: ScreenButton(
                      text: 'Login',
                      nextScreen: () {
                        //Go to login screen.
                        Navigator.pushNamed(context, 'loginScreen');
                      },
                      buttonColors: [Colors.lightBlue, Colors.lightBlue[200]],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: ScreenButton(
                      text: 'Register',
                      nextScreen: () {
                        //Go to login screen.
                        Navigator.pushNamed(context, 'registrationScreen');
                      },
                      buttonColors: [Colors.purpleAccent, Colors.purple[100]],
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

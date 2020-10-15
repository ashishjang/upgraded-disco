import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_chat/widgets/sign_in_button.dart';

import '../constants.dart';
import '../screen_button.dart';
import 'chat_screen.dart';

String email;
String password;
String name;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
          title: Center(
            child: Text(
              'YouChat',
              style: fontStyle(color: Colors.white, size: 20),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'loginScreen');
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          )),
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Flexible(
                child: Row(
                  textBaseline: TextBaseline.ideographic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SignUp ',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                        fontSize: 50,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      '.',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w900,
                        fontSize: 100,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  name = value;
                },
                decoration: kTextFieldDecoration('Enter your name'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration('Enter your email'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: !isVisible,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  password = value;
                  print(password);
                },
                decoration: kTextFieldDecoration('Enter your password')
                    .copyWith(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: isVisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off))),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'league-spartan',
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.redAccent,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                        splashColor: Colors.greenAccent,
                        onPressed: () async {
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);

                            if (newUser != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ChatScreen(name: name)));
                            }
                          } on FirebaseAuthException catch (e) {
                            print(e.message);
                          }
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SignInButton(ImageURL: "assets/images/google_logo.png"),
                    SignInButton(
                      ImageURL: "assets/images/facebook.png",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'loginScreen');
                },
                splashColor: Colors.black,
                focusColor: Colors.black,
                hoverColor: Colors.black,
                child: Text(
                  'Sign in',
                  style: fontStyle(
                      color: Colors.blueGrey, size: 20, underline: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

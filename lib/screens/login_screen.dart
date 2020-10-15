import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:you_chat/authentication/AuthenticationServieces.dart';
import 'package:you_chat/constants.dart';
import 'package:you_chat/widgets/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool isVisibile = false;
  bool showSpinner = false;
  bool isVisible = false;
  final _auth = FirebaseAuth.instance;

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
                onPressed: null)
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          )),
      backgroundColor: Colors.redAccent,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Flexible(
                  child: Container(
                    height: 150.0,
                    child: Row(
                      children: [
                        Text(
                          'Welcome\nBack',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900,
                            fontSize: 50,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            '.',
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.w900,
                              fontSize: 100,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration('Enter you email'),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: !isVisibile,
                  decoration: kTextFieldDecoration('Enter you password')
                      .copyWith(
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisibile = !isVisibile;
                                });
                              },
                              child: isVisibile
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
                      'Sign In',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'league-spartan',
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 40,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                          splashColor: Colors.white,
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              UserCredential newUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                Navigator.pushNamed(context, 'chatScreen');
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            } on FirebaseAuthException catch (e) {
                              print(e.message);
                            }
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SignInButton(
                        ImageURL: "assets/images/google_logo.png",
                      ),
                      SignInButton(
                        ImageURL: "assets/images/facebook.png",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'registrationScreen');
                        },
                        splashColor: Colors.lightBlue,
                        child: Text(
                          'SignUp',
                          style: fontStyle(
                              color: Colors.blueGrey,
                              size: 20,
                              underline: true),
                        ),
                      ),
                      Text(
                        'ForgotPassword?',
                        style: fontStyle(
                            color: Colors.blueGrey, size: 20, underline: true),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

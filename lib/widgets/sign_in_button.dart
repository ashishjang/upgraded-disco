import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_chat/authentication/AuthenticationBloc.dart';
import 'package:you_chat/authentication/AuthenticationEvent.dart';
import 'package:you_chat/authentication/AuthenticationServieces.dart';

class SignInButton extends StatelessWidget {
  String ImageURL;
  SignInButton({this.ImageURL});
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      splashColor: Colors.grey,
      highlightElevation: 4,
      padding: EdgeInsets.all(10),
      shape: CircleBorder(
          side: BorderSide(
              color: Colors.grey, width: 3.0, style: BorderStyle.solid)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image(
          image: AssetImage(ImageURL),
          height: 35.0,
          fit: BoxFit.cover,
        ),
      ),
      onPressed: () => BlocProvider.of<AuthenticationBloc>(context).add(ClickedGoogleLogin()),
    );
  }
}

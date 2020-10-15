import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

TextStyle fontStyle({Color color, double size, bool underline = false}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.bold,
    fontFamily: 'league_spartan',
    fontSize: size,
    letterSpacing: 0.8,
    decoration: underline ? TextDecoration.underline : null,
  );
}

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  fillColor: Colors.blueGrey,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
InputDecoration kTextFieldDecoration(String labeltext) {
  return InputDecoration(
    labelText: labeltext,
    labelStyle: TextStyle(
      color: Colors.blueGrey,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
  );
}

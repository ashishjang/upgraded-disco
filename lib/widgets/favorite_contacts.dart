import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Favorite Contacts',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 20,
            fontFamily: 'league_spartan',
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: Colors.blueGrey,
          ),
          iconSize: 20,
        )
      ],
    );
  }
}

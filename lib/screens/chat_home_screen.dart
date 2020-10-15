import 'package:you_chat/widgets/category_creator.dart';
import 'package:you_chat/widgets/user_list.dart';
import 'package:flutter/material.dart';

class chatHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30,
          onPressed: () {},
        ),
        title: Center(
            child: Text(
          '',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[CategoryCreator(), UserList()],
      ),
    );
  }
}

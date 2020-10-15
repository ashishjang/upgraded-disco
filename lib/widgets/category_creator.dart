import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCreator extends StatefulWidget {
  @override
  _CategoryCreatorState createState() => _CategoryCreatorState();
}

class _CategoryCreatorState extends State<CategoryCreator> {
  int selectedIndex = 0;

  List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.redAccent,
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color: (index == selectedIndex)
                          ? Colors.white
                          : Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'league-spartan',
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              );
            },
            itemCount: categories.length));
  }
}

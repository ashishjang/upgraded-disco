import 'package:you_chat/constants.dart';
import 'package:you_chat/models/message_model.dart';
import 'package:you_chat/screens/chat_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'favorite_contacts.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent[100],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: FavouriteContacts(),
            ),
            Container(
              height: 130,
              decoration: BoxDecoration(
                color: Colors.greenAccent[100],
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage(favorites[index].imageURL),
                        ),
                        Text(
                          favorites[index].name,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontFamily: 'league-spartan',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: favorites.length,
              ),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    child: ListView.builder(
                      itemBuilder: (context, chatNum) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => ChatScreen(
                              //             user: chats[chatNum].sender)));
                            },
                            child: Container(
                                height: 90,
                                margin: EdgeInsets.only(top: 5, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: chats[chatNum].unread
                                        ? Color(0xffFFEFEE)
                                        : Colors.white),
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: AssetImage(
                                            chats[chatNum].sender.imageURL),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            chats[chatNum].sender.name,
                                            style: fontStyle(
                                                color: Colors.black38,
                                                size: 20),
                                          ),
                                          Text(
                                            chats[chatNum].text,
                                            style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(chats[chatNum].time),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          chats[chatNum].unread
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3,
                                                      horizontal: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: Text(
                                                    'New',
                                                    style: fontStyle(
                                                        color: Colors.white,
                                                        size: 15),
                                                  ))
                                              : Text(''),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                      itemCount: chats.length,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

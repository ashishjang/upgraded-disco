import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:you_chat/authentication/AuthenticationServieces.dart';
import 'package:you_chat/constants.dart';
import 'package:you_chat/models/user_model.dart';
import 'login_screen.dart';

User loggedinUser;

final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  String name;
  ChatScreen({this.name});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  String messageValue;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
          onPressed: () {
            Navigator.pushNamed(context, 'chatHomeScreen');
          },
        ),
        title: Center(
            child: Text(
          widget.name,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: () async {
              try {
                setState(() {
                  showSpinner = true;
                });
                await _auth.signOut();
                setState(() {
                  showSpinner = false;
                });
                Navigator.pushNamed(context, 'loginScreen');
              } catch (e) {
                print(e.message);
              }
            },
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                    builder: (context, snapshot) {
                      if (snapshot.data == null)
                        return CircularProgressIndicator();
                      final messages = snapshot.data.docs.reversed;
                      List<MessageBubble> messageBubbles = [];
                      if (snapshot.hasData) {
                        for (var message in messages) {
                          final messageText = message.data()['text'];
                          final messageSender = message.data()['sender'];
                          final messageBubble = MessageBubble(
                              name: widget.name,
                              text: messageText,
                              isMe: loggedinUser?.email == messageSender);
                          messageBubbles.add(messageBubble);
                        }
                      }
                      return Expanded(
                        child: ListView(
                          reverse: true,
                          children: messageBubbles,
                        ),
                      );
                    },
                    stream: _firestore.collection('messages').snapshots(),
                  ),
                  Container(
                    decoration: kMessageContainerDecoration,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: messageTextController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            onChanged: (value) {
                              messageValue = value;
                            },
                            decoration: kMessageTextFieldDecoration.copyWith(
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.attach_file,
                                      color: Colors.blueGrey,
                                    ),
                                    onPressed: null)),
                          ),
                        ),
                        IconButton(
                            iconSize: 37,
                            icon: Icon(
                              Icons.send,
                              color: Colors.greenAccent,
                            ),
                            onPressed: () async {
                              //Implement send functionality.
                              messageTextController.clear();
                              try {
                                await _firestore.collection('messages').add({
                                  'text': messageValue,
                                  'sender': loggedinUser?.email,
                                });
                              } catch (e) {
                                print(e.message);
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  String text;
  String name;
  bool isMe;
  MessageBubble({this.text, this.name, this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$name',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: isMe ? Colors.greenAccent : Colors.redAccent[100],
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))
                  : BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
            ),
            child: Text(
              '$text',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 22,
                fontFamily: 'league-spartan',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

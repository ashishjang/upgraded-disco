import 'package:flutter/material.dart';
import 'user_model.dart';

class Message {
  final UserModel sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  Message({this.sender, this.time, this.text, this.isLiked, this.unread});
}

final UserModel currentUser =
    new UserModel(id: 0, imageURL: 'assets/images/james.jpg', name: 'James');
final UserModel steven =
    UserModel(id: 1, imageURL: 'assets/images/steven.jpg', name: 'Steven');
final UserModel sophia =
    UserModel(id: 2, imageURL: 'assets/images/sophia.jpg', name: 'Sophia');
final UserModel olivia =
    UserModel(id: 3, imageURL: 'assets/images/olivia.jpg', name: 'olivia');
final UserModel greg =
    UserModel(id: 4, imageURL: 'assets/images/greg.jpg', name: 'Greg');
final UserModel sam =
    UserModel(id: 5, imageURL: 'assets/images/sam.jpg', name: 'Sam');
final UserModel james =
    UserModel(id: 6, imageURL: 'assets/images/james.jpg', name: 'James');
final UserModel john =
    UserModel(id: 7, imageURL: 'assets/images/john.jpg', name: 'John');

List<UserModel> favorites = [steven, olivia, greg, sam, james];

List<Message> chats = [
  Message(
    sender: steven,
    time: '5:30 PM',
    text: 'Hey, there how are you?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: '5:30 PM',
    text: 'Hey, there how are you?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: olivia,
    time: '5:30 PM',
    text: 'Hey, there how are you?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: greg,
    time: '5:30 PM',
    text: 'Hey, there how are you?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: john,
    time: '5:30 PM',
    text: 'Hey, there how are you?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sam,
    time: '5:30 PM',
    text: 'Hey, there how are you?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sophia,
    time: '5:30 PM',
    text: 'Hey, there how are you?',
    isLiked: false,
    unread: false,
  ),
];

import 'package:cloud_firestore/cloud_firestore.dart';
class UserModels{
  String uid;
  String documentid;
  int age;
  String username;
  String name;
  String photoURL;
  UserModels({this.uid,this.documentid,this.age, this.username,this.name, this.photoURL});

  factory UserModels.fromFirestore(DocumentSnapshot doc){
    Map data = doc.data();
    return UserModels(
        uid : data['uid'],
        documentid: data['documentid'],
        age: data['age'],
        username: data['username'],
        name: data['name'],
        photoURL: data['photoURL'],
    );
  }
  String toString(){
    return '{uid: $uid,documentid: $documentid, age: $age, username : $username,photoURL: $photoURL }';
  }
}
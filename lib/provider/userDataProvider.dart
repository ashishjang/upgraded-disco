import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:you_chat/models/user_models.dart';
import 'package:you_chat/provider/baseAuthenticationProvider.dart';

class UserDataProvider extends BaseUserDataProvider{
 final fireStore = FirebaseFirestore.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Future<UserModels> saveDetailsFromGoogleAuth(User user) async{

      DocumentReference ref = fireStore.collection('path').doc(user.uid);
      final bool userExist = await ref.snapshots().isEmpty;
      var data= {
        'uid' : user.uid,
        'email': user.email,
        'name' : user.displayName,
      };
      if(!userExist){
        data['photoURL'] = user.photoURL;
      }
        ref.set(data);
        final DocumentSnapshot currentReference =  await ref.get();
          return UserModels.fromFirestore(currentReference);  
  }

  @override
  Future<UserModels> saveProfileDetails(String uid, String profileImageURL, int age , String username) async {
   DocumentReference ref = fireStore.collection('collectionPath').doc(uid);
   var data = {
     'photoURL' : profileImageURL,
     'age': age,
     'userName': username,
   }
  ;
  ref.set(data);
final DocumentSnapshot currentDocument = await ref.get();
 return UserModels.fromFirestore(currentDocument);
  }

  @override
  Future<bool> isProfileComplete(String uid) async{
    DocumentReference ref =
        fireStore.collection('').doc(uid);  // get reference to the user/ uid node
    final DocumentSnapshot currentDocument = await ref.get();
    return (currentDocument.exists&&
        currentDocument.data().containsKey('username') &&
            currentDocument.data().containsKey('age')); 
  }
  
}
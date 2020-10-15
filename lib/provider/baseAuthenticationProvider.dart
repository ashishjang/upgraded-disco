import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:you_chat/models/user_models.dart';

abstract class  BaseAuthenticationProvider{
  Future <User> signInWithGoogle();
  Future<void> signOut();
  Future<User> getCurrentUser();
  Future<bool> isLoggedIn();
}
abstract class  BaseUserDataProvider{
Future<UserModels> saveDetailsFromGoogleAuth(User user);
Future<UserModels> saveProfileDetails(String uid, String profileImageURL, int age , String username) ;
Future <void> isProfileComplete(String uid);

}
abstract class BaseStorageProvider{
Future<String> uploadImage(File file,String path);
}
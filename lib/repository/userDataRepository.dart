import 'package:firebase_auth/firebase_auth.dart';
import 'package:you_chat/models/user_models.dart';
import 'package:you_chat/provider/baseAuthenticationProvider.dart';
import 'package:you_chat/provider/userDataProvider.dart';

class UserDataRepository{
  BaseUserDataProvider userDataProvider = UserDataProvider();
  Future<bool> isProfileComplete(String uid)  => userDataProvider.isProfileComplete(uid);
  Future<UserModels> saveProfileDetails(String uid, String profileImageURL, int age , String username) => userDataProvider.saveProfileDetails(uid, profileImageURL, age, username);
  Future <UserModels> saveDetailsFromGoogleAuth(User user)=>userDataProvider.saveDetailsFromGoogleAuth(user);
}
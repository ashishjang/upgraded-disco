import 'package:firebase_auth/firebase_auth.dart';
import 'package:you_chat/authentication/AuthenticationEvent.dart';
import 'package:you_chat/provider/authenticationProvider.dart';
import 'package:you_chat/provider/baseAuthenticationProvider.dart';

class AuthenticationRepository {
  BaseAuthenticationProvider authenticationProvider = AuthenticationProvider();
   
Future<User> signInWithGoogle() => authenticationProvider.signInWithGoogle();
Future<bool> isLoggedIn() => authenticationProvider.isLoggedIn();

Future<void> signOut() => authenticationProvider.signOut();
Future<User> getCurrentUser() => authenticationProvider.getCurrentUser();

}
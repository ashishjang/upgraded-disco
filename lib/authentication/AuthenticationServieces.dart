import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignInAccount googleUser;
String name;
String imageURL;
String email;
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  UserCredential _user =
      await FirebaseAuth.instance.signInWithCredential(credential);
  assert(_user.user.email != null);

  if (_user == null) {
    print("user is null");
  }
  return _user;
}

Future<User> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult result = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final FacebookAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(result.accessToken.token);

  // Once signed in, return the UserCredential
  final UserCredential _user =
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  if (_user == null) {
    print("user is null");
  }
  return _user.user;
}

Future<void> signOutGoogle() async {
  await GoogleSignIn().signOut();

  print("User Signed Out");
}

Future<void> signOutFacebook() async {
  await FacebookAuth.instance.logOut();
  print("User Signed Out");
}

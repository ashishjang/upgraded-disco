import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:you_chat/provider/baseAuthenticationProvider.dart';

class AuthenticationProvider extends BaseAuthenticationProvider{
 final _auth = FirebaseAuth.instance;
  GoogleSignInAccount googleUser;
  GoogleSignIn googleSignIn = new GoogleSignIn();
  @override
  Future<User> getCurrentUser() async{
    return  await _auth.currentUser;
  }

  @override
  Future<bool> isLoggedIn() async {
    // TODO: implement isLoggedIn
    final user = await _auth.currentUser;
    return user!=null;
  }

  @override
  Future<User> signInWithGoogle() async{
    googleUser = await googleSignIn.signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );


  UserCredential _user =
      await FirebaseAuth.instance.signInWithCredential(credential);
  assert(_user.user.email != null);
      
  if (_user == null) {
    print("user is null");
  }
  return _auth.currentUser;
  }

  @override
  Future<void> signOut() async{
    await _auth.signOut();
    await googleSignIn.signOut();
  }
  
}
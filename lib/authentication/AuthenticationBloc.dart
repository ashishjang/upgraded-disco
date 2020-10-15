import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:you_chat/authentication/AuthenticationEvent.dart';
import 'package:you_chat/authentication/AuthenticationState.dart';
import 'package:you_chat/repository/authenticationRepository.dart';
import 'package:you_chat/repository/storageRepository.dart';
import 'package:you_chat/repository/userDataRepository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  final AuthenticationRepository authenticationRepository;
  final StorageRepository storageRepository;
  final UserDataRepository userDataRepository;
  AuthenticationBloc({this.authenticationRepository,this.storageRepository,this.userDataRepository}) : super(Uninitialized());
   
Stream<AuthenticationState> mapEventToState(
  AuthenticationEvent event,
) async*{
  print(event);
  if(event is AppLaunched){
    yield* mapAppLaunchedToState();
  }else if(event is ClickedGoogleLogin){
    yield* mapClickedGoogleLoginToState();
  }else if(event is LoggedIn){
     yield *mapLoggedOutToState();
  }else if(event is PickedProfilePicture){
    yield ReceivedProfilePicture(event.file);
  }else if(event is SaveProfile){
    yield *mapSaveProfileToState(
      event.profileImagefile,event.age, event.username
    );}else if(event is ClickedLogout){
      yield* mapLoggedOutToState();
    }
  }

Stream<AuthenticationState> mapAppLaunchedToState() async*{
 try{
   yield AuthInProgress();
   final isSignedIn = await authenticationRepository.isLoggedIn();
   if(isSignedIn){
     final user = await authenticationRepository.getCurrentUser();
     bool isProfileComplete = await userDataRepository.isProfileComplete(user.uid);
     print(isProfileComplete);
     if(isProfileComplete){
       yield ProfileUpdated();
     }else{
       yield Authenticated(user);
     }
   }
 }catch(_, message){
   print (message);
  yield UnAuthenticated();
 }
 }

Stream<AuthenticationState>mapClickedGoogleLoginToState()async*{
  yield AuthInProgress();
  try{
    User user  = await authenticationRepository.signInWithGoogle();
    bool isProfileComplete = await userDataRepository.isProfileComplete(user.uid);
    print(isProfileComplete);
    if(isProfileComplete){
      yield ProfileUpdated();
    }else {
      yield Authenticated(user);
    }
  }catch(_, message){
    print(message);
    yield UnAuthenticated();
  }
}
Stream<AuthenticationState> mapSaveProfileToState(File fileUpload, int age , String username)async*{
yield ProfileUpdateInProgress();
String profileImageURL = await storageRepository.uploadImage(fileUpload, fileUpload.path);
User user = await authenticationRepository.getCurrentUser();
await userDataRepository.saveProfileDetails(user.uid, profileImageURL, age, username);
yield ProfileUpdated();
}
Stream <AuthenticationState> mapLoggedOutToState() async*{
yield UnAuthenticated();
authenticationRepository.signInWithGoogle();
}
}
 
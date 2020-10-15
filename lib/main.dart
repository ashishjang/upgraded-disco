import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_chat/authentication/AuthenticationBloc.dart';
import 'package:you_chat/authentication/AuthenticationEvent.dart';
import 'package:you_chat/provider/authenticationProvider.dart';
import 'package:you_chat/provider/userDataProvider.dart';
import 'package:you_chat/repository/authenticationRepository.dart';
import 'package:you_chat/repository/storageRepository.dart';
import 'package:you_chat/repository/userDataRepository.dart';
import 'package:you_chat/screens/chat_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:you_chat/screens/welcome_screen.dart';
import 'package:you_chat/screens/login_screen.dart';
import 'package:you_chat/screens/registration_screen.dart';
import 'package:you_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'authentication/AuthenticationState.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   final AuthenticationRepository authenticationRepository = AuthenticationRepository();
   final UserDataRepository userDataRepository = UserDataRepository();
   final StorageRepository storatageRepository = StorageRepository();

  runApp(BlocProvider(child: MyApp(),create:(BuildContext context)=>AuthenticationBloc(authenticationRepository: authenticationRepository,userDataRepository: userDataRepository,storageRepository: storatageRepository)..add(AppLaunched())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.redAccent,
        ),
        home: BlocBuilder<AuthenticationBloc,AuthenticationState>(builder: (context, state){
          if(state is UnAuthenticated){
            return RegistrationScreen();
          }else if(state is ProfileUpdated){
             
          }else{
            return RegistrationScreen();
          }
        }),
        
        );
       
  }
}

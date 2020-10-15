import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const <dynamic>[]]);
}

 class AppLaunched extends AuthenticationEvent {
  @override
  String toString() => 'AppLaunched';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

 class ClickedGoogleLogin extends AuthenticationEvent {
  @override
  String toString() => 'ClickedGoogleLogin';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

  class LoggedIn extends AuthenticationEvent {
  final User user;
  LoggedIn(this.user);
  @override
  String toString() => 'LoggedIn';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

 class PickedProfilePicture extends AuthenticationEvent {
  final File file;
  PickedProfilePicture(this.file);
  @override
  String toString() => 'PickedProfilePicture';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class SaveProfile extends AuthenticationEvent {
  final File profileImagefile;
  final int age;
  final String username;
  SaveProfile(this.profileImagefile, this.age, this.username);
  @override
  String toString() => 'SaveProfile';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ClickedLogout extends AuthenticationEvent {
  @override
  String toString() => 'ClickedLogout';

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

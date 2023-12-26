import 'package:aiohs_web_admin/login/models/user.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;  
  LoginSuccess({required this.user});
}

class LoginFailed extends LoginState {
  final String error;
  LoginFailed({required this.error});
}
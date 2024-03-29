import 'package:aiohs_web_admin/login/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<User> {
  UserCubit() : super(User());

  void setUser(User user) {
    debugPrint(user.toJson().toString());
    emit(user);
  }
  
  void initState() {
    emit(User());
  }
}
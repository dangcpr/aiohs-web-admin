import 'package:aiohs_web_admin/login/cubits/login/login_cubit.dart';
import 'package:aiohs_web_admin/login/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: LoginScreen(),
    );
  }
}
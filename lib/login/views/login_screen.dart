import 'package:aiohs_web_admin/login/widgets/login_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Đăng nhập",
      color: Colors.black,
      child: Scaffold(
        body: Center(child: LoginWidget()),
      ),
    );
  }
}

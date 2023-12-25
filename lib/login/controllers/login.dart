import 'package:aiohs_web_admin/utilities/global/varible.dart';

class LoginController {
  Future<void> login() async {
    await Future.delayed(const Duration(seconds: 2));
    isLogin = true;
  }
}
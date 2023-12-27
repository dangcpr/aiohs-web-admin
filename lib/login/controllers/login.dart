import 'package:aiohs_web_admin/login/models/user.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:aiohs_web_admin/utilities/global/varible.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController {
  Future<User> login(String email, String password) async {
    try {
      var response = await dio.post('/user/login', data: {
        "email": email,
        "password": password,
      });
      if (response.data['code'] == 0) {
        if (response.data['user']['role'] != 'admin') {
          throw 'Bạn không có quyền truy cập';
        }

        if (response.data['user']['status'] == 'inactive' || response.data['user']['status'] == 'locked') {
          throw 'Tài khoản của bạn đã bị khóa';
        }

        isLogin = true;
        var token = response.data['token'];
        const storage = FlutterSecureStorage();
        await storage.write(key: 'token', value: token);
        debugPrint(await storage.read(key: 'token'));

        User user = User.fromJson(response.data['data']);
        return user;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    }
  }
}

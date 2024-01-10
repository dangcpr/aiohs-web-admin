import 'package:aiohs_web_admin/user_manage/models/user.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserManageController {
  Future<UserResult> getUser(String next, {
    String? user_code,
    String? user_name,
    String? from_date,
    String? to_date,
    String? role,
  }) async {
    // Chuyển chuỗi rỗng => null
    user_code = user_code == '' ? null : user_code;
    user_name = user_name == '' ? null : user_name;
    from_date = from_date == '' ? null : from_date;
    to_date = to_date == '' ? null : to_date;
    role = role == '' ? null : role;
    debugPrint(role);
    
    try {
      DateTime now = DateTime.now();
      var response = await dio.get('/admin/user-managements', queryParameters: {
        'limit': 5,
        'next': next,
        'role': role ?? 'USER_ROLE_UNSPECIFIED',
        'user_code': user_code,
        'user_name': user_name,
        'from_date': from_date ?? from_date_default,
        'to_date': to_date ?? '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}',
      });
      await Future.delayed(Duration(milliseconds: 400));
      debugPrint(response.data.toString());
      if (response.data['code'] == 0) {
        // Gửi thông báo ở đây
        List<UserModel> users = [];
        response.data['users'].forEach((element) {
          users.add(UserModel.fromJson(element));
        });

        UserResult userResult = UserResult(
          next: response.data['next'],
          data: users,
        );

        return userResult;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> lockUser(String userCode) async {
    try {
      final response = await dio.get('/admin/user-managements/$userCode/lock');
      await Future.delayed(Duration(milliseconds: 400));
      if (response.data['code'] == 0) {
        // Gửi thông báo ở đây
        return;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }
}

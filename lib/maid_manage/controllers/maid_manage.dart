import 'package:aiohs_web_admin/maid_manage/models/maid_info.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MaidManageController {
  Future<MaidInfoRating> getMaidInfoRating(String maid_code) async {
    try {
      var response = await dio.get(
        '/admin/maid-managements/$maid_code/rating',
      );

      debugPrint(response.data.toString());

      if(response.data['code'] == 0) {
        MaidInfoRating maidInfoRating = MaidInfoRating.fromJson(response.data);
        return maidInfoRating;
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> removeMaid(String maid_code, String reason) async {
    try {
      var response = await dio.post(
        '/admin/maid-managements/$maid_code/remove',
        data: {
          'reason': reason,
        },
      );

      if(response.data['code'] == 0) {
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
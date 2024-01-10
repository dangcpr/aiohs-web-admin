import 'package:aiohs_web_admin/holiday/models/holiday.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HolidayController {
  Future<List<Holiday>> getHolidays({
    String? month,
  }) async {
    DateTime now = DateTime.now();
    month = month ?? '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}';
    try {
      var response = await dio.get('/admin/holidays', queryParameters: {
        'month': month,
      });
      if (response.data['code'] == 0) {
        List<Holiday> holidays = [];
        response.data['holidays'].forEach((holiday) {
          holidays.add(Holiday.fromJson(holiday));
        });
        return holidays;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      debugPrint(e.message.toString());
      throw handleError(e);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<void> createHoliday({
    required String name,
    required String date,
  }) async {
    try {
      var response = await dio.post('/admin/holidays', data: {
        'name': name,
        'date': date,
      });
      if (response.data['code'] == 0) {
        return;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      debugPrint(e.message.toString());
      throw handleError(e);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<void> updateHoliday({
    required String id,
    required String name,
    required String date,
  }) async {
    try {
      var response = await dio.put('/admin/holidays/$id', data: {
        'name': name,
        'date': date,
      });
      if (response.data['code'] == 0) {
        return;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      debugPrint(e.message.toString());
      throw handleError(e);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<void> deleteHoliday({
    required String id,
  }) async {
    try {
      var response = await dio.get('/admin/holidays/$id/delete');
      if (response.data['code'] == 0) {
        return;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      debugPrint(e.message.toString());
      throw handleError(e);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}

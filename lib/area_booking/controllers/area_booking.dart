import 'package:aiohs_web_admin/area_booking/models/area_booking.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AreaBookingController {
  Future<AreaBookingResult> getAreaBooking(String next, {
    int limit = 10,
    String? from_date,
    String? to_date,
    String? status,
    String? user_code,
    String? type,
    String? code,
  }) async {
    try {
      DateTime now = DateTime.now();
      from_date = from_date == '' || from_date == null ? from_date_default : from_date;
      to_date = to_date == '' || to_date == null ? '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}' : to_date;
      status = status == '' || status == null ? 'AREA_BOOKING_STATUS_ACTIVE' : status;
      user_code = user_code == '' ? null : user_code;
      type = type == '' || type == null ? 'AREA_BOOKING_TYPE_RENT' : type;
      code = code == '' ? null : code;

      debugPrint(to_date);

      final response = await dio.get('/admin/area-booking', 
        queryParameters: {
          'limit': limit,
          'next': next,
          'from_date': from_date,
          'to_date': to_date,
          'status': status,
          'user_code': user_code,
          'code': code,
          'type': type,
        }
      );
      await Future.delayed(Duration(milliseconds: 400));

      if (response.data['code'] == 0) {
        List<AreaBooking> areaBookings = [];
        response.data['posts'].forEach((areaBooking) {
          areaBookings.add(AreaBooking.fromJson(areaBooking));
        });

        return AreaBookingResult(
          next: response.data['next'],
          areaBookings: areaBookings,
        );
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> cancelAreaBooking(String code, String reason) async {
    try {
      final response = await dio.post('/admin/area-booking/$code/close', 
        data: {
          'reason': reason,
        }
      );

      if (response.data['code'] == 0) {
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
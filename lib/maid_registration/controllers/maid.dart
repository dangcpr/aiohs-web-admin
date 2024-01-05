import 'package:aiohs_web_admin/maid_registration/models/maid_registration.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';

class MaidRegistrationController {
  Future<MaidRegistrationResult> getMaidRegistration(String status) async {
    try {
      var response =
          await dio.get('/admin/maid-registration', queryParameters: {
        'status': status,
        'next': '0',
        'limit': 10,
      });
      await Future.delayed(Duration(milliseconds: 400));
      if (response.data['code'] == 0) {
        List<MaidRegistration> maidRegistration = [];
        response.data['registrations'].forEach((element) {
          maidRegistration.add(MaidRegistration.fromJson(element));
        });

        MaidRegistrationResult maidRegistrationResult = MaidRegistrationResult(
          next: response.data['next'],
          data: maidRegistration,
        );
        return maidRegistrationResult;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> approveMaidRegistration(String user_code) async {
    try {
      var response = await dio.post('/admin/maid-registration/$user_code/reviews', data: {
        'action': 'ACTION_APPROVE',
      });
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

    Future<void> upateMaidRegistration(String user_code, String reason) async {
    try {
      var response = await dio.post('/admin/maid-registration/$user_code/reviews', data: {
        'action': 'ACTION_REQUEST_UPDATE',
        'reason': reason
      });
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

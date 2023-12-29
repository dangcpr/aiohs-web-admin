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
}

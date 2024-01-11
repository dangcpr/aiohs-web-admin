import 'package:aiohs_web_admin/job_posting/models/job_posting.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';

class JobPostingController {
  Future<JobPostingResult> getJobPosting(
    String next, {
    String? status,
    String? user_code,
    String? code,
    String? from_date,
    String? to_date,
  }) async {
    try {
      DateTime now = DateTime.now();
      from_date =
          from_date == '' || from_date == null ? from_date_default : from_date;
      to_date = to_date == '' || to_date == null
          ? '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}'
          : to_date;
      status = status == '' || status == null
          ? 'JOB_POSTING_STATUS_ACTIVE'
          : status;
      user_code = user_code == '' ? null : user_code;
      code = code == '' ? null : code;

      final response = await dio.get(
        '/admin/job-posting',
        queryParameters: {
          'status': status,
          'user_code': user_code,
          'code': code,
          'from_date': from_date,
          'to_date': to_date,
          'next': next,
          'limit': 10,
        },
      );
      if (response.data['code'] == 0) {
        List<JobPosting> jobs = [];
        response.data['jobs'].forEach((element) {
          jobs.add(JobPosting.fromJson(element));
        });

        return JobPostingResult(
          next: response.data['next'],
          results: jobs,
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

  Future<void> cancelJob(String code, String reason) async {
    try {
      var response = await dio.post(
        '/admin/job-posting/$code/close',
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

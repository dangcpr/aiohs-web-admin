import 'package:aiohs_web_admin/dashboard/models/report.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';

class ReportController {
  Future<ReportResult> getReport({
    String? from_date,
    String? to_date,
  }) async {
    num totalRentalOrderQuantity = 0;
    num totalReceivedOrderQuantity = 0;
    num totalRentalAmount = 0;
    num totalReceivedAmount = 0;
    List<Report> data = [];

    try {
      final response = await dio.get(
        '/admin/order-reports',
        queryParameters: {
          'from_date': from_date,
          'to_date': to_date,
        },
      );

      if(response.data['code'] == 0) {
        for (var item in response.data['reports']) {
          data.add(Report.fromJson(item));
          totalRentalOrderQuantity += item['rental_order_quantity'];
          totalReceivedOrderQuantity += item['received_order_quantity'];
          totalRentalAmount += item['rental_amount'];
          totalReceivedAmount += item['received_amount'];      
        }
        return ReportResult(
          data: data,
          totalRentalOrderQuantity: totalRentalOrderQuantity,
          totalReceivedOrderQuantity: totalReceivedOrderQuantity,
          totalRentalAmount: totalRentalAmount,
          totalReceivedAmount: totalReceivedAmount,
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
}

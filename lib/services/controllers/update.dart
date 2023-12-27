import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';

class UpdateServiceController {
  Future<void> updateCleaningHourly({
    required String name,
    required String title,
    required String icon_url,
    required double unit_price,
    required double discount,
    required double bring_tools,
    required double on_peak_date,
    required double on_peak_hour,
    required double on_holiday,
    required double on_weekend,
  }) async {
    try {
      final response = await dio.put('/admin/products/CLEAN_ON_DEMAND', data: {
        "name": name,
        "title": title,
        "type": "PRODUCT_TYPE_MAIN",
        "icon_url": icon_url,
        "status": "PRODUCT_STATUS_ACTIVE",
        "product_price": {
          "unit_price": unit_price,
          "discount": discount,
          "bring_tools": bring_tools,
          "on_peak_date": on_peak_date,
          "on_peak_hour": on_peak_hour,
          "on_holiday":  on_holiday,
          "on_weekend": on_weekend,
        },
      });
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

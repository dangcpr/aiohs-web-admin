import 'package:aiohs_web_admin/services/models/product.dart';
import 'package:aiohs_web_admin/services/models/every_product.dart/cleaning_hourly.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';

class ServicesController {
  Future<List<Product>> getServices() async {
    try {
      var response = await dio.get('/admin/products');
      if (response.data['code'] == 0) {
        List<Product> services = [];
        services = (response.data['products'] as List)
            .map((e) => Product.fromJson(e))
            .toList();
        return services;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<CleaningHourlyPrice> getCleaningHourlyPrice() async {
    try {
      var response = await dio.get('/user/products/CLEAN_ON_DEMAND');
      if (response.data['code'] == 0) {
        CleaningHourlyPrice cleaningHourlyPrice =
            CleaningHourlyPrice.fromJson(response.data['price']);
        return cleaningHourlyPrice;
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
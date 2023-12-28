import 'package:aiohs_web_admin/services/models/every_product.dart/air_cond_clean.dart';
import 'package:aiohs_web_admin/services/models/every_product.dart/cleaning_sub.dart';
import 'package:aiohs_web_admin/services/models/every_product.dart/cooking.dart';
import 'package:aiohs_web_admin/services/models/every_product.dart/laundry.dart';
import 'package:aiohs_web_admin/services/models/every_product.dart/shopping.dart';
import 'package:aiohs_web_admin/services/models/product.dart';
import 'package:aiohs_web_admin/services/models/every_product.dart/cleaning_hourly.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServicesController {
  Future<List<Product>> getServices() async {
    try {
      var response = await dio.get('/admin/products');
      if (response.data['code'] == 0) {
        List<Product> services = [];
        services = (response.data['products'] as List)
            .map((e) => Product.fromJson(e))
            .toList();
        services = services.where((element) => element.code != 'ROOM').toList();
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

  Future<CleaningSubPrice> getCleaningSubPrice() async {
    try {
      var response = await dio.get('/user/products/CLEAN_SUBSCRIPTION');
      if (response.data['code'] == 0) {
        CleaningSubPrice cleaningSubPrice =
            CleaningSubPrice.fromJson(response.data['price']);
        return cleaningSubPrice;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<ShoppingPrice> getShoppingPrice() async {
    try {
      var response = await dio.get('/user/products/GROCERY_ASSISTANT');
      if (response.data['code'] == 0) {
        ShoppingPrice shoppingPrice =
            ShoppingPrice.fromJson(response.data['price']);
        return shoppingPrice;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<CookingPrice> getCookingPrice() async {
    try {
      var response = await dio.get('/user/products/HOME_COOKING');
      if (response.data['code'] == 0) {
        CookingPrice cookingPrice =
            CookingPrice.fromJson(response.data['price']);
        return cookingPrice;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<LaundryPrice> getLaundryPrice() async {
    try {
      final response = await dio.get('/user/products/LAUNDRY');

      if (response.data['code'] == 0) {
        LaundryPrice laundryPrice =
            LaundryPrice.fromJson(response.data['price']);
        debugPrint(laundryPrice.toJson().toString());
        return laundryPrice;
      } else {
        throw response.data['message'];
      }
    } on DioException catch (e) {
      throw handleError(e);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<AirCondCleanPrice> getAirCondCleanPrice() async {
    try {
      final response = await dio.get('/user/products/AIR_CONDITIONING_CLEAN');

      if (response.data['code'] == 0) {
        AirCondCleanPrice airCondCleanPrice =
            AirCondCleanPrice.fromJson(response.data['price']);
        debugPrint(airCondCleanPrice.toJson().toString());
        return airCondCleanPrice;
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

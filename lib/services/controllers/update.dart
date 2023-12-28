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
          "on_holiday": on_holiday,
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

  Future<void> updateCleaningSub({
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
      final response =
          await dio.put('/admin/products/CLEAN_SUBSCRIPTION', data: {
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
          "on_holiday": on_holiday,
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

  Future<void> updateShopping({
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
      final response =
          await dio.put('/admin/products/GROCERY_ASSISTANT', data: {
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
          "on_holiday": on_holiday,
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

  Future<void> updateCooking({
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
      final response = await dio.put('/admin/products/HOME_COOKING', data: {
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
          "on_holiday": on_holiday,
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

  Future<void> updateLaundry({
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
    required double clothes,
    required double blanket,
    required double mosquito,
    required double net,
    required double drap,
    required double topper,
    required double pillow,
    required double comple,
    required double vietnamDress,
    required double weedingDress,
    required double bleaching,
  }) async {
    try {
      final response = await dio.put('/admin/products/LAUNDRY', data: {
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
          "on_holiday": on_holiday,
          "on_weekend": on_weekend,
          "laundry_price": {
            "normal_cleaning": {
              "Clothes": clothes,
              "Blanket": blanket,
              "Mosquito": mosquito,
              "Net": net,
              "Drap": drap,
              "Topper": topper,
              "Pillow": pillow
            },
            "others": {
              "Comple": comple,
              "VietnamDress": vietnamDress,
              "WeddingDress": weedingDress,
              "Bleaching": bleaching
            }
          },
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

  Future<void> updateAirCondCleanPrice({
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
    required double wall_Bellow2HP,
    required double wall_Above2HP,
    required double wall_GasRefill,
    required double portal_Portable,
    required double portal_GasRefill,
    required double cassette_Bellow3HP,
    required double cassette_Above3HP,
    required double cassette_GasRefill,
    required double floor_Bellow5HP,
    required double floor_Above5HP,
    required double floor_GasRefill,
    required double built_in_BuiltIn,
    required double built_in_GasRefill,
  }) async {
    try {
      final response = await dio.put('/admin/products/AIR_CONDITIONING_CLEAN', data: {
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
          "on_holiday": on_holiday,
          "on_weekend": on_weekend,
          "air_conditioning_clean_price": {
            "wall": {
              "Bellow2HP": wall_Bellow2HP,
              "Above2HP": wall_Above2HP,
              "GasRefill": wall_GasRefill
            },
            "portable": {
              "Portable": portal_Portable,
              "GasRefill": portal_GasRefill
            },
            "cassette": {
              "Bellow3HP": cassette_Bellow3HP,
              "Above3HP": cassette_Above3HP,
              "GasRefill": cassette_GasRefill
            },
            "floor": {
              "Bellow5HP": floor_Bellow5HP,
              "Above5HP": floor_Above5HP,
              "GasRefill": floor_GasRefill
            },
            "built_in": {
              "BuiltIn": built_in_BuiltIn,
              "GasRefill": built_in_GasRefill
            }
          }
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

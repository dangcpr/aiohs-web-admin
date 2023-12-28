import 'package:aiohs_web_admin/services/models/every_product.dart/air_cond_clean.dart';

abstract class GetAirCondCleanPriceState {}

class GetAirCondCleanPriceInitial extends GetAirCondCleanPriceState {}

class GetAirCondCleanPriceLoading extends GetAirCondCleanPriceState {}

class GetAirCondCleanPriceSuccess extends GetAirCondCleanPriceState {
  final AirCondCleanPrice airCondCleanPrice;

  GetAirCondCleanPriceSuccess({required this.airCondCleanPrice});
}

class GetAirCondCleanPriceFailure extends GetAirCondCleanPriceState {
  final String error;

  GetAirCondCleanPriceFailure({required this.error});
}

import 'package:aiohs_web_admin/services/models/every_product.dart/cleaning_hourly.dart';

abstract class GetCleaningHourlyPriceState {}

class GetCleaningHourlyPriceInitial extends GetCleaningHourlyPriceState {}

class GetCleaningHourlyPriceLoading extends GetCleaningHourlyPriceState {}

class GetCleaningHourlyPriceSuccess extends GetCleaningHourlyPriceState {
  final CleaningHourlyPrice cleaningHourlyPrice;

  GetCleaningHourlyPriceSuccess({required this.cleaningHourlyPrice});
}

class GetCleaningHourlyPriceFailure extends GetCleaningHourlyPriceState {
  final String error;

  GetCleaningHourlyPriceFailure({required this.error});
}

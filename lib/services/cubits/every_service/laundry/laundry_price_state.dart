import 'package:aiohs_web_admin/services/models/every_product.dart/laundry.dart';

abstract class GetLaundryPriceState {}

class GetLaundryPriceInitial extends GetLaundryPriceState {}

class GetLaundryPriceLoading extends GetLaundryPriceState {}

class GetLaundryPriceSuccess extends GetLaundryPriceState {
  final LaundryPrice laundryPrice;

  GetLaundryPriceSuccess({required this.laundryPrice});
}

class GetLaundryPriceFailure extends GetLaundryPriceState {
  final String error;

  GetLaundryPriceFailure({required this.error});
}

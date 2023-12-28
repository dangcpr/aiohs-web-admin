import 'package:aiohs_web_admin/services/models/every_product.dart/cooking.dart';

abstract class GetCookingPriceState {}

class GetCookingPriceInitial extends GetCookingPriceState {}

class GetCookingPriceLoading extends GetCookingPriceState {}

class GetCookingPriceSuccess extends GetCookingPriceState {
  final CookingPrice cookingPrice;

  GetCookingPriceSuccess({required this.cookingPrice});
}

class GetCookingPriceFailure extends GetCookingPriceState {
  final String error;

  GetCookingPriceFailure({required this.error});
}

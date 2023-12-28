import 'package:aiohs_web_admin/services/models/every_product.dart/shopping.dart';

abstract class GetShoppingPriceState {}

class GetShoppingPriceInitial extends GetShoppingPriceState {}

class GetShoppingPriceLoading extends GetShoppingPriceState {}

class GetShoppingPriceSuccess extends GetShoppingPriceState {
  final ShoppingPrice shoppingPrice;

  GetShoppingPriceSuccess({required this.shoppingPrice});
}

class GetShoppingPriceFailure extends GetShoppingPriceState {
  final String error;

  GetShoppingPriceFailure({required this.error});
}

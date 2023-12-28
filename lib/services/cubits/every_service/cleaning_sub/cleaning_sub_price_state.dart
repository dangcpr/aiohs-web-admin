import 'package:aiohs_web_admin/services/models/every_product.dart/cleaning_sub.dart';

abstract class GetCleaningSubPriceState {}

class GetCleaningSubPriceInitial extends GetCleaningSubPriceState {}

class GetCleaningSubPriceLoading extends GetCleaningSubPriceState {}

class GetCleaningSubPriceSuccess extends GetCleaningSubPriceState {
  final CleaningSubPrice cleaningSubPrice;

  GetCleaningSubPriceSuccess({required this.cleaningSubPrice});
}

class GetCleaningSubPriceFailure extends GetCleaningSubPriceState {
  final String error;

  GetCleaningSubPriceFailure({required this.error});
}

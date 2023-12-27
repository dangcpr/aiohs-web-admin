import 'package:aiohs_web_admin/services/models/product.dart';

abstract class GetServiceState {}

class GetServiceInitial extends GetServiceState {}

class GetServiceLoading extends GetServiceState {}

class GetServiceSuccess extends GetServiceState {
  final List<Product> services;

  GetServiceSuccess({required this.services});
}

class GetServiceFailure extends GetServiceState {
  final String error;

  GetServiceFailure({required this.error});
}
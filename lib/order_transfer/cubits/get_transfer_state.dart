import 'package:aiohs_web_admin/order_transfer/models/transaction.dart';

abstract class GetTransferState {}

class GetTransferInitial extends GetTransferState {}

class GetTransferLoading extends GetTransferState {}

class GetTransferLoaded extends GetTransferState {
  final List<Transaction> transfers;

  GetTransferLoaded({required this.transfers});
}

class GetTransferError extends GetTransferState {
  final String message;

  GetTransferError({required this.message});
}
import 'package:aiohs_web_admin/order_transfer/controllers/transaction.dart';
import 'package:aiohs_web_admin/order_transfer/cubits/get_transfer_state.dart';
import 'package:aiohs_web_admin/order_transfer/models/transaction.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetTransferCubit extends Cubit<GetTransferState> {
  GetTransferCubit() : super(GetTransferInitial());

  List<Transaction> transfers = [];

  Future<void> getTransfer({
    String? status,
    String? related_order,
  }) async {
    emit(GetTransferLoading());
    try {
      final transfer = await TransactionController().getTransactions(
        status: status,
        related_order: related_order,
      );
      transfers = transfer;
      emit(GetTransferLoaded(transfers: transfer));
    } catch (e) {
      emit(GetTransferError(message: e.toString()));
    }
  }

  void initState() {
    emit(GetTransferInitial());
  }
}

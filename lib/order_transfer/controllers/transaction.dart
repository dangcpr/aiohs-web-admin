import 'dart:io';

import 'package:aiohs_web_admin/order_transfer/models/order_overview.dart';
import 'package:aiohs_web_admin/order_transfer/models/transaction.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionController {
  Future<List<Transaction>> getTransactions({
    String? status,
    String? related_order,
  }) async {
    try {
      final response = await dio.get('/admin/transactions', queryParameters: {
        'status': status ?? 'TRANSACTION_STATUS_UNSPECIFIED',
        'related_order': related_order,
      });
      debugPrint(response.data['transactions'].toString());

      List<Transaction> transactions = [];
      response.data['transactions'].forEach((element) {
        transactions.add(Transaction.fromJson(element));
      });

      return transactions;
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw handleError(e);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<void> transferMoney({
    required String receiver,
    required String related_order,
    required double amount,
    required String description,
    required File image,
    required PlatformFile platformFile,
    required String bank_code,
    required String txs_code,
  }) async {
    try {
      String url = await uploadImage(image, platformFile);
      debugPrint('789');

      final response = await dio.post('/admin/transactions', data: {
        'receiver': receiver,
        'related_order': related_order,
        'amount': amount,
        'description': description,
        'image': url, // uploadImage.data['url'],
        'bank_code': bank_code,
        'txs_code': txs_code,
      });
      if (response.data['code'] != 0) throw response.data['message'];
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw handleError(e);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  Future<OrderOverview> getOrderOverview({
    required String order_code,
  }) async {
    try {
      debugPrint(DateFormat('yyyy-MM-dd').format(DateTime.now()));
      final response = await dio.get('/admin/orders', queryParameters: {
        'order_code': order_code,
        'from_date': '2023-10-10',
        'to_date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'limit': '100',
      });
      debugPrint(response.data.toString());

      List<OrderOverview> orderOverview = [];

      response.data['orders'].forEach((element) {
        orderOverview.add(OrderOverview.fromJson(element));
      });

      if (orderOverview.length == 0) throw "Order not found";

      return orderOverview[0];
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw handleError(e);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }
}

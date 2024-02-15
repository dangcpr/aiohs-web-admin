import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';

class OrderTransferScreen extends StatefulWidget {
  const OrderTransferScreen({super.key});

  @override
  State<OrderTransferScreen> createState() => _OrderTransferScreenState();
}

class _OrderTransferScreenState extends State<OrderTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Quản lý đơn hàng - Chuyển tiền",
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: SelectableText("Quản lý đơn hàng - Chuyển tiền",
              style: TextStyle(fontFamily: fontFamilyBold)),
        ),
      ),
    );
  }
}
import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/order_transfer/cubits/get_transfer_cubit.dart';
import 'package:aiohs_web_admin/order_transfer/widgets/transfer_table.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTransferScreen extends StatefulWidget {
  const OrderTransferScreen({super.key});

  @override
  State<OrderTransferScreen> createState() => _OrderTransferScreenState();
}

class _OrderTransferScreenState extends State<OrderTransferScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetTransferCubit>().initState();
    context.read<GetTransferCubit>().getTransfer();
  }
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Quản lý đơn hàng - Chuyển tiền",
      color: Colors.white,
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        appBar: AppBar(
          title: SelectableText("Giao dịch chuyển tiền",
              style: TextStyle(fontFamily: fontFamilyBold)),
        ),
        body: Column(
          children: [
            Expanded(child: TransferTable()),
          ],
        )
      ),
    );
  }
}
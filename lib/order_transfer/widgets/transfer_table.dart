import 'package:aiohs_web_admin/order_transfer/cubits/get_transfer_cubit.dart';
import 'package:aiohs_web_admin/order_transfer/widgets/transfer_money.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransferTable extends StatefulWidget {
  const TransferTable({super.key});

  @override
  State<TransferTable> createState() => _TransferTableState();
}

class _TransferTableState extends State<TransferTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var getTransferCubit = context.watch<GetTransferCubit>();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 1000,
        dataRowHeight: 100,
        empty: Text("Không có dữ liệu"),
        headingTextStyle: TextStyle(
          fontFamily: fontFamilyBold,
          color: isDark ? Colors.white : Colors.black,
        ),
        showBottomBorder: true,
        headingRowHeight: 80,
        columns: [
          DataColumn2(
              label: Text('Mã giao dịch', softWrap: true),
              tooltip: "Mã giao dịch",
              fixedWidth: 50),
          DataColumn(
              label: Text('Người gửi', softWrap: true), tooltip: "Người gửi"),
          DataColumn(
              label: Text('Người nhận', softWrap: true), tooltip: "Người nhận"),
          DataColumn(
              label: Text('Số tiền giao dịch', softWrap: true),
              tooltip: "Số tiền giao dịch"),
          DataColumn(
              label: Text('Chi tiết', softWrap: true), tooltip: "Chi tiết"),
          DataColumn(
              label: Text('Trạng thái', softWrap: true), tooltip: "Trạng thái"),
          DataColumn(
              label: Text('Phương thức thanh toán', softWrap: true),
              tooltip: "Phương thức thanh toán"),
          DataColumn(
              label: Text('Đơn hàng liên quan', softWrap: true),
              tooltip: "Đơn hàng liên quan"),
          DataColumn(
              label: Text('Hình ảnh giao dịch', softWrap: true),
              tooltip: "Hình ảnh giao dịch"),
          DataColumn(
              label: Text('Ngày tạo', softWrap: true), tooltip: "Ngày tạo"),
          DataColumn(
              label: Text('Ngày cập nhật', softWrap: true),
              tooltip: "Ngày cập nhật"),
          DataColumn(
              label: Text('Thao tác', softWrap: true), tooltip: "Thao tác"),
        ],
        rows: [
          for (var transaction in getTransferCubit.transfers)
            DataRow(
              cells: [
                DataCell(Text(transaction.id)),
                DataCell(Text(transaction.sender)),
                DataCell(Text(transaction.receiver)),
                DataCell(Text(
                  NumberFormat.currency(locale: 'vi_VN', symbol: 'đ')
                      .format(transaction.amount),
                )),
                DataCell(Text(transaction.description)),
                DataCell(Text(transaction.status_display)),
                DataCell(Text(transaction.payment_provider)),
                DataCell(Text(transaction.related_order)),
                DataCell(
                  transaction.image == ""
                      ? Text("Không có hình ảnh")
                      : ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Hình ảnh giao dịch',
                                        style: TextStyle(
                                            fontFamily: fontFamilyBold,
                                            fontSize: fontSize.mediumLarger)),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                content: Image.network(transaction.image),
                              ),
                            );
                          },
                          child: Text('Xem'),
                        ),
                ),
                DataCell(Text(transaction.created_at)),
                DataCell(Text(transaction.updated_at)),
                DataCell(
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          scrollable: true,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Giao dịch chuyển tiền',
                                  style: TextStyle(
                                      fontFamily: fontFamilyBold,
                                      fontSize: fontSize.mediumLarger)),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                          content: TransferMoney(
                            sender: transaction.sender,
                            receiver: transaction.receiver,
                            related_order: transaction.related_order,
                            amount: transaction.amount.toDouble(),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.money_rounded),
                    tooltip: "Giao dịch chuyển tiền",
                  ),
                ),
              ],
            ),
        ],
      ),
    );

    // if (maidRegistrationCubit.maidRegistrations.length == 0)
    //   SelectableText("Không có dữ liệu"),
    // if (maidRegistrationCubit.state is MaidRegistrationLoading)
    //   CircularProgressIndicator(
    //     color: colorProject.primaryColor,
    //   )
    // else
    //   ElevatedButton(
    //     onPressed: () {
    //       maidRegistrationCubit.maidRegistrations;
    //     },
    //     child: Text("Tải thêm dữ liệu"),
    //   )
  }
}

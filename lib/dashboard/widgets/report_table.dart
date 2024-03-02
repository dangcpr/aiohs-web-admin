import 'package:aiohs_web_admin/dashboard/cubits/get_report/get_report_cubit.dart';
import 'package:aiohs_web_admin/dashboard/cubits/get_report/get_report_state.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReportTable extends StatefulWidget {
  const ReportTable({super.key});

  @override
  State<ReportTable> createState() => _ReportTableState();
}

class _ReportTableState extends State<ReportTable> {
  NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');
  @override
  Widget build(BuildContext context) {
    var getReport = context.watch<GetReportCubit>();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 1000,
        headingRowHeight: 80,
        empty: getReport.state is GetReportFailure
            ? Text((getReport.state as GetReportFailure).error)
            : (getReport.state is GetReportLoading
                ? Text('Đang tải ...')
                : Text('Không có dữ liệu')),
        headingTextStyle: TextStyle(
          fontFamily: fontFamilyBold,
          color: isDark ? Colors.white : Colors.black,
        ),
        columns: const [
          DataColumn2(
              label: Text('Mã người dùng', softWrap: true), fixedWidth: 150),
          DataColumn2(
            label: Text('Tài khoản', softWrap: true),
          ),
          DataColumn2(
              label: Text('Số đơn đã tạo', softWrap: true), fixedWidth: 150),
          DataColumn2(
              label: Text('Số tiền đã chi', softWrap: true), fixedWidth: 150),
          DataColumn2(
              label: Text('Số đơn đã nhận', softWrap: true), fixedWidth: 150),
          DataColumn2(
              label: Text('Doanh thu', softWrap: true), fixedWidth: 150),
        ],
        rows: [
          for (var report in getReport.reportResult.data)
            DataRow(cells: [
              DataCell(
                  Text(report.user_code == '' ? '(trống)' : report.user_code)),
              DataCell(
                  Text(report.user_name == '' ? '(trống)' : report.user_name)),
              DataCell(Text(report.rental_order_quantity.toString())),
              DataCell(Text(currencyFormat.format(report.rental_amount))),
              DataCell(Text(report.received_order_quantity.toString())),
              DataCell(Text(currencyFormat.format(report.received_amount))),
            ]),
        ],
      ),
    );
  }
}

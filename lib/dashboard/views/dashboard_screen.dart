import 'package:aiohs_web_admin/dashboard/cubits/get_report/get_report_cubit.dart';
import 'package:aiohs_web_admin/dashboard/widgets/report_table.dart';
import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetReportCubit>().initState();
    context.read<GetReportCubit>().getReport(
          from_date: '2023-10-10',
          to_date: '2024-02-16',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Trang chủ",
      color: Colors.white,
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        appBar: AppBar(
          title: SelectableText("Trang chủ",
              style: TextStyle(fontFamily: fontFamilyBold)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ReportTable(),
            ),
          ],
        ),
      ),
    );
  }
}

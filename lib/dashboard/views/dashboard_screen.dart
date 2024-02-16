import 'package:aiohs_web_admin/dashboard/cubits/get_report/get_report_cubit.dart';
import 'package:aiohs_web_admin/dashboard/widgets/report_card.dart';
import 'package:aiohs_web_admin/dashboard/widgets/report_table.dart';
import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/components/text_field.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController from_date_controller = TextEditingController();
  DateTime from_date = DateTime.parse('2023-10-10');
  TextEditingController to_date_controller = TextEditingController();
  DateTime to_date = DateTime.now();
  DateTime now = DateTime.now();
  String now_string = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    from_date_controller.text = '2023-10-10';
    to_date_controller.text = DateFormat('yyyy-MM-dd').format(to_date);
    context.read<GetReportCubit>().initState();
    context.read<GetReportCubit>().getReport(
          from_date: '2023-10-10',
          to_date: now_string,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 400,
                  child: TextFieldBasic(
                    controller: from_date_controller,
                    label: 'Từ ngày',
                    isReadOnly: true,
                    onTap: () async {
                      DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: from_date,
                        firstDate: DateTime(2023),
                        lastDate: now,
                        currentDate: now,
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: colorProject.primaryColor,
                                onPrimary: Colors.white,
                              ),
                              buttonTheme: ButtonThemeData(
                                  textTheme: ButtonTextTheme.primary),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (dateTime != null) {
                        setState(() {
                          from_date = dateTime;
                          from_date_controller.text =
                              DateFormat('yyyy-MM-dd').format(dateTime);
                        });
                      }
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: 400,
                  child: TextFieldBasic(
                    controller: to_date_controller,
                    label: 'Đến ngày',
                    isReadOnly: true,
                    onTap: () async {
                      DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: to_date,
                        firstDate: DateTime(2023),
                        lastDate: now,
                        currentDate: now,
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: colorProject.primaryColor,
                                onPrimary: Colors.white,
                              ),
                              buttonTheme: ButtonThemeData(
                                  textTheme: ButtonTextTheme.primary),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (dateTime != null) {
                        setState(() {
                          to_date = dateTime;
                          to_date_controller.text =
                              DateFormat('yyyy-MM-dd').format(dateTime);
                        });
                      }
                    },
                  ),
                ),
                Container(
                  child: ButtonBasic(
                    text: 'Tìm kiếm',
                    onPressed: () {
                      context.read<GetReportCubit>().getReport(
                            from_date: from_date_controller.text,
                            to_date: to_date_controller.text,
                          );
                    },
                  ),
                ),
              ],
            ),
            Responsive.isDesktop(context)
                ? Wrap(
                    spacing: 20,
                    children: [
                      ReportCard(
                        title: 'Số đơn đã tạo',
                        subtitle: context
                            .watch<GetReportCubit>()
                            .reportResult
                            .totalRentalOrderQuantity
                            .toInt(),
                        icons: Icons.area_chart,
                      ),
                      ReportCard(
                        title: 'Số đơn đã hoàn thành',
                        subtitle: context
                            .watch<GetReportCubit>()
                            .reportResult
                            .totalReceivedOrderQuantity
                            .toInt(),
                        icons: Icons.show_chart_outlined,
                      ),
                      ReportCard(
                        title: 'Doanh thu (VNĐ)',
                        subtitle: context
                            .watch<GetReportCubit>()
                            .reportResult
                            .totalReceivedAmount
                            .toInt(),
                        icons: Icons.money,
                      ),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ReportCard(
                          title: 'Số đơn đã tạo',
                          subtitle: context
                              .watch<GetReportCubit>()
                              .reportResult
                              .totalRentalOrderQuantity
                              .toInt(),
                          icons: Icons.area_chart,
                        ),
                        SizedBox(height: 10),
                        ReportCard(
                          title: 'Số đơn đã hoàn thành',
                          subtitle: context
                              .watch<GetReportCubit>()
                              .reportResult
                              .totalReceivedOrderQuantity
                              .toInt(),
                          icons: Icons.show_chart_outlined,
                        ),
                        SizedBox(height: 10),
                        ReportCard(
                          title: 'Doanh thu (VNĐ)',
                          subtitle: context
                              .watch<GetReportCubit>()
                              .reportResult
                              .totalReceivedAmount
                              .toInt(),
                          icons: Icons.money,
                        ),
                      ],
                    ),
                  ),
            Expanded(
              child: ReportTable(),
            ),
          ],
        ),
      ),
    );
  }
}

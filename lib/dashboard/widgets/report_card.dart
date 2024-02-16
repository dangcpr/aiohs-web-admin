import 'package:aiohs_web_admin/dashboard/cubits/get_report/get_report_cubit.dart';
import 'package:aiohs_web_admin/dashboard/cubits/get_report/get_report_state.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportCard extends StatefulWidget {
  const ReportCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icons});

  final String title;
  final int subtitle;
  final IconData icons;

  @override
  State<ReportCard> createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: Responsive.isDesktop(context)
          ? (MediaQuery.of(context).size.width - 400) / 3
          : MediaQuery.of(context).size.width - 20,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: ListTile(
        title: Text(widget.title),
        subtitle: context.watch<GetReportCubit>().state is GetReportLoading
            ? Text("Đang tải...", style: TextStyle(fontSize: 20))
            : Countup(
                begin: 0,
                end: widget.subtitle.toDouble(),
                duration: Duration(seconds: 2),
                separator: ',',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        leading: Icon(widget.icons),
      ),
    );
  }
}

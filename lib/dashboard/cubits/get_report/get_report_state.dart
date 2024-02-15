import 'package:aiohs_web_admin/dashboard/models/report.dart';

abstract class GetReportState {}

class GetReportInitial extends GetReportState {}

class GetReportLoading extends GetReportState {}

class GetReportSuccess extends GetReportState {
  final ReportResult reports;

  GetReportSuccess({required this.reports});
}

class GetReportFailure extends GetReportState {
  final String error;

  GetReportFailure(this.error);
}

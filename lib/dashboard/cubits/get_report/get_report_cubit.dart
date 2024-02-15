import 'package:aiohs_web_admin/dashboard/controller/report.dart';
import 'package:aiohs_web_admin/dashboard/cubits/get_report/get_report_state.dart';
import 'package:aiohs_web_admin/dashboard/models/report.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetReportCubit extends Cubit<GetReportState> {
  GetReportCubit() : super(GetReportInitial());

  ReportResult reportResult = ReportResult(
    data: [],
    totalRentalOrderQuantity: 0,
    totalReceivedOrderQuantity: 0,
    totalRentalAmount: 0,
    totalReceivedAmount: 0,
  );

  Future<void> getReport({
    String? from_date,
    String? to_date,
  }) async {
    emit(GetReportLoading());
    try {
      final report = await ReportController().getReport(
        from_date: from_date,
        to_date: to_date,
      );
      reportResult = report;
      emit(GetReportSuccess(reports: report));
    } catch (e) {
      emit(GetReportFailure(e.toString()));
    }
  }

  void initState() {
    reportResult = ReportResult(
      data: [],
      totalRentalOrderQuantity: 0,
      totalReceivedOrderQuantity: 0,
      totalRentalAmount: 0,
      totalReceivedAmount: 0,
    );
  }
}

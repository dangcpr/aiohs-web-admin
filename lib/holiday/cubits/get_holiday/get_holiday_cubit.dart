import 'package:aiohs_web_admin/holiday/controllers/holiday.dart';
import 'package:aiohs_web_admin/holiday/cubits/get_holiday/get_holiday_state.dart';
import 'package:aiohs_web_admin/holiday/models/holiday.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetHolidaysCubit extends Cubit<GetHolidaysState> {
  GetHolidaysCubit() : super(GetHolidaysInitial());

  Future<void> getHolidays({
    String? month,
  }) async {
    emit(GetHolidaysLoading());
    try {
      List<Holiday> holidays = await HolidayController().getHolidays(month: month);
      emit(GetHolidaysSuccess(holidays));
    } catch (e) {
      emit(GetHolidaysFailure(e.toString()));
    }
  }

  void initState() {
    emit(GetHolidaysInitial());
  }
}

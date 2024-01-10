import 'package:aiohs_web_admin/holiday/models/holiday.dart';

abstract class GetHolidaysState {}

class GetHolidaysInitial extends GetHolidaysState {}

class GetHolidaysLoading extends GetHolidaysState {}

class GetHolidaysSuccess extends GetHolidaysState {
  final List<Holiday> holidays;

  GetHolidaysSuccess(this.holidays);
}

class GetHolidaysFailure extends GetHolidaysState {
  final String error;

  GetHolidaysFailure(this.error);
}
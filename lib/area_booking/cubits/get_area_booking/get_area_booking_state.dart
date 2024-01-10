import 'package:aiohs_web_admin/area_booking/models/area_booking.dart';

abstract class GetAreaBookingState {}

class GetAreaBookingInitial extends GetAreaBookingState {}

class GetAreaBookingLoading extends GetAreaBookingState {}

class GetAreaBookingSuccess extends GetAreaBookingState {
  final List<AreaBooking> areaBookingList;

  GetAreaBookingSuccess({required this.areaBookingList});
}

class GetAreaBookingFailure extends GetAreaBookingState {
  final String error;

  GetAreaBookingFailure({required this.error});
}
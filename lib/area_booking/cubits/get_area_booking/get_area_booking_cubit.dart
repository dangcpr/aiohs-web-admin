import 'package:aiohs_web_admin/area_booking/controllers/area_booking.dart';
import 'package:aiohs_web_admin/area_booking/cubits/get_area_booking/get_area_booking_state.dart';
import 'package:aiohs_web_admin/area_booking/models/area_booking.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAreaBookingCubit extends Cubit<GetAreaBookingState> {
  GetAreaBookingCubit() : super(GetAreaBookingInitial());

  String next = "0";
  List<AreaBooking> areaBookingList = [];

  Future<void> getAreaBooking({
    String? from_date,
    String? to_date,
    String? status,
    String? user_code,
    String? code,
    String? type,
  }) async {
    emit(GetAreaBookingLoading());
    try {
      if (next == "0" && areaBookingList.isNotEmpty) {
        return;
      }
      AreaBookingResult areaBookingResult =
          await AreaBookingController().getAreaBooking(
        next,
        from_date: from_date,
        to_date: to_date,
        status: status,
        user_code: user_code,
        code: code,
        type: type,
      );
      areaBookingList.addAll(areaBookingResult.areaBookings);
      next = areaBookingResult.next;
      emit(GetAreaBookingSuccess(areaBookingList: areaBookingList));
    } catch (e) {
      emit(GetAreaBookingFailure(error: e.toString()));
    }
  }

  void initState() {
    next = "0";
    areaBookingList = [];
    emit(GetAreaBookingInitial());
  }
}

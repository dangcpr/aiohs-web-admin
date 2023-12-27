import 'package:aiohs_web_admin/services/controllers/services.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/cleaning_hourly/cleaning_hourly_price_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCleaningHourlyPriceCubit extends Cubit<GetCleaningHourlyPriceState> {
  GetCleaningHourlyPriceCubit() : super(GetCleaningHourlyPriceInitial());

  Future<void> getCleaningHourlyPrice() async {
    emit(GetCleaningHourlyPriceLoading());
    try {
      final response = await ServicesController().getCleaningHourlyPrice();
      emit(GetCleaningHourlyPriceSuccess(cleaningHourlyPrice: response));
    } catch (e) {
      emit(GetCleaningHourlyPriceFailure(error: e.toString()));
    }
  }
}
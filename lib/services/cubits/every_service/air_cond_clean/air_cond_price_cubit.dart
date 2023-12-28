import 'package:aiohs_web_admin/services/controllers/services.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/air_cond_clean/air_cond_price_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAirCondCleanPriceCubit extends Cubit<GetAirCondCleanPriceState> {
  GetAirCondCleanPriceCubit() : super(GetAirCondCleanPriceInitial());

  Future<void> getAirCondCleanPrice() async {
    emit(GetAirCondCleanPriceLoading());
    try {
      final response = await ServicesController().getAirCondCleanPrice();
      emit(GetAirCondCleanPriceSuccess(airCondCleanPrice: response));
    } catch (e) {
      emit(GetAirCondCleanPriceFailure(error: e.toString()));
    }
  }
}
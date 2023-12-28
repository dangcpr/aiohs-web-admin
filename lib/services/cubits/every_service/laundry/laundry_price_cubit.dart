import 'package:aiohs_web_admin/services/controllers/services.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/laundry/laundry_price_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetLaundryPriceCubit extends Cubit<GetLaundryPriceState> {
  GetLaundryPriceCubit() : super(GetLaundryPriceInitial());

  Future<void> getLaundryPrice() async {
    emit(GetLaundryPriceLoading());
    try {
      final response = await ServicesController().getLaundryPrice();
      emit(GetLaundryPriceSuccess(laundryPrice: response));
    } catch (e) {
      emit(GetLaundryPriceFailure(error: e.toString()));
    }
  }
}
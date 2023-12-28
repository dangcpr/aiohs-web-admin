import 'package:aiohs_web_admin/services/controllers/services.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/cooking/cooking_price_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCookingPriceCubit extends Cubit<GetCookingPriceState> {
  GetCookingPriceCubit() : super(GetCookingPriceInitial());

  Future<void> getCookingPrice() async {
    emit(GetCookingPriceLoading());
    try {
      final response = await ServicesController().getCookingPrice();
      emit(GetCookingPriceSuccess(cookingPrice: response));
    } catch (e) {
      emit(GetCookingPriceFailure(error: e.toString()));
    }
  }
}
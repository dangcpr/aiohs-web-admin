import 'package:aiohs_web_admin/services/controllers/services.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/shopping/shopping_price_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetShoppingPriceCubit extends Cubit<GetShoppingPriceState> {
  GetShoppingPriceCubit() : super(GetShoppingPriceInitial());

  Future<void> getShoppingPrice() async {
    emit(GetShoppingPriceLoading());
    try {
      final response = await ServicesController().getShoppingPrice();
      emit(GetShoppingPriceSuccess(shoppingPrice: response));
    } catch (e) {
      emit(GetShoppingPriceFailure(error: e.toString()));
    }
  }
}
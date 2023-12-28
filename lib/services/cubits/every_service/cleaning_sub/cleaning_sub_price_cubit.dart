import 'package:aiohs_web_admin/services/controllers/services.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/cleaning_sub/cleaning_sub_price_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCleaningSubPriceCubit extends Cubit<GetCleaningSubPriceState> {
  GetCleaningSubPriceCubit() : super(GetCleaningSubPriceInitial());

  Future<void> getCleaningSubPrice() async {
    emit(GetCleaningSubPriceLoading());
    try {
      final response = await ServicesController().getCleaningSubPrice();
      emit(GetCleaningSubPriceSuccess(cleaningSubPrice: response));
    } catch (e) {
      emit(GetCleaningSubPriceFailure(error: e.toString()));
    }
  }
}
import 'package:aiohs_web_admin/services/controllers/services.dart';
import 'package:aiohs_web_admin/services/cubits/get_service/get_service_state.dart';
import 'package:aiohs_web_admin/services/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetServiceCubit extends Cubit<GetServiceState> {
  GetServiceCubit() : super(GetServiceInitial());

  Future<void> getService() async {
    emit(GetServiceLoading());
    try {
      List<Product> services = await ServicesController().getServices();
      emit(GetServiceSuccess(services: services));
    } catch (e) {
      emit(GetServiceFailure(error: e.toString()));
    }
  }
}
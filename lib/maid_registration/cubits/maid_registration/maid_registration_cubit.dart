import 'package:aiohs_web_admin/maid_registration/controllers/maid.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_state.dart';
import 'package:aiohs_web_admin/maid_registration/models/maid_registration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaidRegistrationCubit extends Cubit<MaidRegistrationState> {
  MaidRegistrationCubit() : super(MaidRegistrationInitial());
  List<MaidRegistration> maidRegistrations = [];
  String next = "0";
  
  Future<void> registerMaid(String status) async {
    emit(MaidRegistrationLoading());
    try {
      if (next == "0" && maidRegistrations.isNotEmpty) {
        return;
      }
      MaidRegistrationResult maidRegistrationResult =
          await MaidRegistrationController().getMaidRegistration(status);
      maidRegistrations = maidRegistrationResult.data;
      next = maidRegistrationResult.next;
      emit(MaidRegistrationSuccess(
          maidRegistrationResult: maidRegistrationResult));
    } catch (e) {
      emit(MaidRegistrationFailure(error: e.toString()));
    }
  }

  Future<void> initState() async {
    maidRegistrations.clear();
    next = "0";
  }
}
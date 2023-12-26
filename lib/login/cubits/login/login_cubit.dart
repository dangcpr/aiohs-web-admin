import 'package:aiohs_web_admin/login/controllers/login.dart';
import 'package:aiohs_web_admin/login/cubits/login/login_state.dart';
import 'package:aiohs_web_admin/login/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  User user = User();

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      var user = await LoginController().login(email, password);
      user = this.user;
      emit(LoginSuccess(user: user));
    } catch (e) {
      emit(LoginFailed(error: e.toString()));
    }
  }
}
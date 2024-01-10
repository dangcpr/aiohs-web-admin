import 'package:aiohs_web_admin/user_manage/controllers/user_manage.dart';
import 'package:aiohs_web_admin/user_manage/cubits/get_user/get_user_state.dart';
import 'package:aiohs_web_admin/user_manage/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetListUserCubit extends Cubit<GetListUserState> {
  GetListUserCubit() : super(GetListUserInitial());

  List<UserModel> users = [];
  String next = "0";

  Future<void> getListUser({
    String? user_code,
    String? user_name,
    String? from_date,
    String? to_date,
    String? role,
  }) async {
    emit(GetListUserLoading());
    try {
      if (next == "0" && users.isNotEmpty) {
        return;
      }
      UserResult userResult = await UserManageController().getUser(next,
          user_code: user_code,
          user_name: user_name,
          from_date: from_date,
          to_date: to_date,
          role: role);

      users.addAll(userResult.data);
      next = userResult.next;
      emit(GetListUserSuccess(users: users));
    } catch (e) {
      debugPrint('error');
      emit(GetListUserFailure(error: e.toString()));
    }
  }

  void initState() {
    next = "0";
    users = [];
    emit(GetListUserInitial());
  }
}

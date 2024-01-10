import 'package:aiohs_web_admin/user_manage/models/user.dart';

abstract class GetListUserState {}

class GetListUserInitial extends GetListUserState {}

class GetListUserLoading extends GetListUserState {}

class GetListUserSuccess extends GetListUserState {
  final List<UserModel> users;

  GetListUserSuccess({required this.users});
}

class GetListUserFailure extends GetListUserState {
  final String error;

  GetListUserFailure({required this.error});
}
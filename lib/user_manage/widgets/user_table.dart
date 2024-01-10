// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/user_manage/controllers/user_manage.dart';
import 'package:aiohs_web_admin/user_manage/cubits/get_user/get_user_cubit.dart';
import 'package:aiohs_web_admin/user_manage/cubits/get_user/get_user_state.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTable extends StatefulWidget {
  const UserTable({super.key});

  @override
  State<UserTable> createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  @override
  Widget build(BuildContext context) {
    var getListUserCubit = context.watch<GetListUserCubit>();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 1000,
        dataRowHeight: 100,
        headingRowHeight: 80,
        empty: getListUserCubit.state is GetListUserFailure
            ? Text((getListUserCubit.state as GetListUserFailure).error)
            : (getListUserCubit.state is GetListUserLoading
                ? Text('Đang tải ...')
                : Text('Không có dữ liệu')),
        headingTextStyle: TextStyle(
          fontFamily: fontFamilyBold,
          color: isDark ? Colors.white : Colors.black,
        ),
        columns: const [
          DataColumn(label: Text('Mã người dùng', softWrap: true)),
          DataColumn(label: Text('Tên đầy đủ', softWrap: true)),
          DataColumn(label: Text('Email', softWrap: true)),
          DataColumn(label: Text('Số điện thoại', softWrap: true)),
          DataColumn(label: Text('Vai trò', softWrap: true)),
          DataColumn(label: Text('Địa chỉ mặc định', softWrap: true)),
          DataColumn(label: Text('Trạng thái', softWrap: true)),
          DataColumn(label: Text('Ảnh đại diện', softWrap: true)),
          DataColumn(label: Text('Ngày tạo tài khoản', softWrap: true)),
          DataColumn(label: Text('Ngày cập nhật cuối cùng', softWrap: true)),
          DataColumn(label: Text('Thao tác', softWrap: true)),
        ],
        rows: [
          for (var user in getListUserCubit.users)
            DataRow(
              cells: [
                DataCell(Text(user.code == '' ? '(trống)' : user.code)),
                DataCell(
                    Text(user.full_name == '' ? '(trống)' : user.full_name)),
                DataCell(Text(user.email == '' ? '(trống)' : user.email)),
                DataCell(Text(
                    user.phone_number == '' ? '(trống)' : user.phone_number)),
                DataCell(Text(
                    user.role_display == '' ? '(trống)' : user.role_display)),
                DataCell(Text(user.default_address == ''
                    ? '(trống)'
                    : user.default_address)),
                DataCell(Text(user.status_display == ''
                    ? '(trống)'
                    : user.status_display)),
                DataCell(
                  user.avatar_url == ''
                      ? Text('(trống)')
                      : Image.network(
                          user.avatar_url,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                ),
                DataCell(
                    Text(user.created_at == '' ? '(trống)' : user.created_at)),
                DataCell(
                    Text(user.updated_at == '' ? '(trống)' : user.updated_at)),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        tooltip: 'Khóa tài khoản',
                        icon: Icon(Icons.lock),
                        onPressed: () {
                          showDialogWarning(
                            context: context,
                            message: 'Bạn có chắc chắn muốn khóa tài khoản ' + user.code + '?',
                            btnOkOnPress: () async {
                              showCircleProgress(context);
                              try {
                                await UserManageController().lockUser(user.code);
                                Navigator.pop(context);
                                showDialogSuccess(context, "Khóa tài khoản thành công");
                                context.read<GetListUserCubit>().initState();
                                context.read<GetListUserCubit>().getListUser();
                              } catch (e) {
                                Navigator.pop(context);
                                showDialogError(context, e.toString());
                              }
                            }, 
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}

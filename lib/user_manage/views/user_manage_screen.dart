import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/user_manage/cubits/get_user/get_user_cubit.dart';
import 'package:aiohs_web_admin/user_manage/cubits/get_user/get_user_state.dart';
import 'package:aiohs_web_admin/user_manage/widgets/filter_dialog.dart';
import 'package:aiohs_web_admin/user_manage/widgets/user_table.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserManageScreen extends StatefulWidget {
  const UserManageScreen({super.key});

  @override
  State<UserManageScreen> createState() => _UserManageScreenState();
}

class _UserManageScreenState extends State<UserManageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetListUserCubit>().initState();
    context.read<GetListUserCubit>().getListUser();
  }

  @override
  Widget build(BuildContext context) {
    var getListUserCubit = context.watch<GetListUserCubit>();
    return Title(
      title: "Quản lý người dùng",
      color: Colors.white,
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        appBar: AppBar(
          title: SelectableText("Quản lý người dùng",
              style: TextStyle(fontFamily: fontFamilyBold)),
          actions: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bộ lọc",
                          style: TextStyle(
                            fontFamily: fontFamilyBold,
                            fontSize: fontSize.large,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    content: FilterDialog(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.filter_alt_outlined,
                    color: colorProject.primaryColor,
                  ),
                  Text(
                    "Bộ lọc",
                    style: TextStyle(
                      color: colorProject.primaryColor,
                      fontFamily: fontFamilyBold,
                      fontSize: fontSize.mediumLarger,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(child: UserTable()),
            if (getListUserCubit.state is GetListUserLoading)
              CircularProgressIndicator(
                color: colorProject.primaryColor,
              ),

            if (getListUserCubit.next != "0")
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorProject.primaryColor,
                ),
                onPressed: () {
                  getListUserCubit.getListUser();
                },
                child: Text("Tải thêm dữ liệu",
                    style: TextStyle(color: Colors.white)),
              ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}

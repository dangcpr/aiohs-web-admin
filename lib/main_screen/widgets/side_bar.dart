import 'package:aiohs_web_admin/login/cubits/user_cubit.dart';
import 'package:aiohs_web_admin/main_screen/cubits/page_number.dart';
import 'package:aiohs_web_admin/main_screen/widgets/drawer_list_tile.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      surfaceTintColor: colorProject.primaryColor,
      shadowColor: Colors.black.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo_full.png"),
          ),
          // DrawerListTile(
          //   title: "Trang chủ",
          //   icon: Icons.dashboard,
          //   press: () {
          //     context.read<SideBarController>().updateIndex(0);
          //     context.go('/main/dashboard');
          //   },
          // ),
          DrawerListTile(
            title: "Quản lý người dùng",
            icon: Icons.person,
            press: () {
              context.read<SideBarController>().updateIndex(1);
              context.go('/main/user-manage');
            },
          ),
          DrawerListTile(
            title: "Dịch vụ",
            icon: Icons.cleaning_services,
            press: () {
              context.read<SideBarController>().updateIndex(2);
              context.go('/main/service');
            },
          ),
          DrawerListTile(
            title: "Ngày lễ",
            icon: Icons.calendar_month,
            press: () {
              context.read<SideBarController>().updateIndex(3);
              context.go('/main/holiday');
            },
          ),
          DrawerListTile(
            title: "Đăng ký giúp việc",
            icon: Icons.app_registration,
            press: () {
              context.read<SideBarController>().updateIndex(4);
              context.go('/main/maid-registration');
            },
          ),
          DrawerListTile(
            title: "Quản lý giúp việc",
            icon: Icons.workspaces,
            press: () {
              context.read<SideBarController>().updateIndex(5);
              context.go('/main/maid-manage');
            },
          ),
          DrawerListTile(
            title: "Tin thuê chỗ",
            icon: Icons.home_work,
            press: () {
              context.read<SideBarController>().updateIndex(6);
              context.go('/main/area-booking');
            },
          ),
          DrawerListTile(
            title: "Tin tuyển giúp việc",
            icon: Icons.work,
            press: () {
              context.read<SideBarController>().updateIndex(7);
              context.go('/main/job-posting');
            },
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                context.read<UserCubit>().state.avatar_url != ""
                    ? CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            context.read<UserCubit>().state.avatar_url!),
                      )
                    : CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          "assets/images/avatar.png",
                        ),
                      ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Xin chào, ",
                      style: TextStyle(
                        fontSize: fontSize.mediumLarger,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      context.read<UserCubit>().state.email!,
                      style: TextStyle(
                        fontSize: fontSize.mediumLarger,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

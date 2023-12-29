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
          DrawerListTile(
            title: "Trang chủ",
            icon: Icons.dashboard,
            press: () {
              context.read<SideBarController>().updateIndex(0);
              context.go('/main/dashboard');
            },
          ),
          DrawerListTile(
            title: "Dịch vụ",
            icon: Icons.cleaning_services,
            press: () {
              context.read<SideBarController>().updateIndex(1);
              context.go('/main/service');
            },
          ),
          DrawerListTile(
            title: "Đăng ký giúp việc",
            icon: Icons.app_registration,
            press: () {
              context.read<SideBarController>().updateIndex(2);
              context.go('/main/maid-registration');
            },
          ),
        ],
      ),
    );
  }
}

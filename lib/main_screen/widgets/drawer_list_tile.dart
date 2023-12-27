import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        if (Responsive.isMobile(context)) context.pop();
        if (Responsive.isMobile(context)) await Future.delayed(Duration(milliseconds: 200));
        press();
      },
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
      ),
    );
  }
}

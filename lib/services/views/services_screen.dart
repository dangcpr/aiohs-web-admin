import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Responsive.isMobile(context) ? SideBar() : null,
      appBar: AppBar(
        title: Text("Quản lý dịch vụ", style: TextStyle(fontFamily: fontFamilyBold)),
      ),
      body: Text("Quản lý dịch vụ"),
    );
  }
}
import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/services/cubits/get_service/get_service_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/services_table.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetServiceCubit>().getService();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Dịch vụ",
      color: Colors.white,
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        appBar: AppBar(
          title: SelectableText("Quản lý dịch vụ",
              style: TextStyle(fontFamily: fontFamilyBold)),
        ),
        body: ServiceTable(),
      ),
    );
  }
}

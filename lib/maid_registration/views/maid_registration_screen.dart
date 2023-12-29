import 'dart:convert';

import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_cubit.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_state.dart';
import 'package:aiohs_web_admin/maid_registration/widgets/maid_regis_table.dart';
import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaidRegistrationScreen extends StatefulWidget {
  const MaidRegistrationScreen({super.key});

  @override
  State<MaidRegistrationScreen> createState() => _MaidRegistrationScreenState();
}

class _MaidRegistrationScreenState extends State<MaidRegistrationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MaidRegistrationCubit>().initState();
    context
        .read<MaidRegistrationCubit>()
        .registerMaid("MAID_REGISTRATION_STATUS_CREATED");
    debugPrint(jsonEncode(
        context.read<MaidRegistrationCubit>().maidRegistrations.toString()));
  }

  @override
  Widget build(BuildContext context) {
    var maidRegistrationCubit = context.watch<MaidRegistrationCubit>();
    return Title(
      title: "Đăng ký giúp việc",
      color: Colors.white,
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        appBar: AppBar(
          title: SelectableText("Đăng ký giúp việc",
              style: TextStyle(fontFamily: fontFamilyBold)),
        ),
        body: Column(children: [
          Expanded(child: MaidRegistrationTable()),
          if (maidRegistrationCubit.state is MaidRegistrationLoading)
            CircularProgressIndicator(
              color: colorProject.primaryColor,
            ),
          if(maidRegistrationCubit.next != "0")
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorProject.primaryColor,
              ),
              onPressed: () {
                maidRegistrationCubit.maidRegistrations;
              },
              child: Text("Tải thêm dữ liệu",
                  style: TextStyle(color: Colors.white)),
            ),
          SizedBox(height: 30,)
        ]),
      ),
    );
  }
}

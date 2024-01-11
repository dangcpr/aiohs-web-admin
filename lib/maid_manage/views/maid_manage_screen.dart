import 'package:aiohs_web_admin/maid_manage/widgets/maid_table.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_cubit.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_state.dart';
import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaidManageScreen extends StatefulWidget {
  const MaidManageScreen({super.key});

  @override
  State<MaidManageScreen> createState() => _MaidManageScreenState();
}

class _MaidManageScreenState extends State<MaidManageScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MaidRegistrationCubit>().initState();
    context
        .read<MaidRegistrationCubit>()
        .registerMaid("MAID_REGISTRATION_STATUS_APPROVED");
  }

  @override
  Widget build(BuildContext context) {
    var maidRegistrationCubit = context.watch<MaidRegistrationCubit>();
    return Title(
      title: "Quản lý giúp việc",
      color: Colors.white,
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        appBar: AppBar(
          title: SelectableText(
            "Quản lý giúp việc",
            style: TextStyle(fontFamily: fontFamilyBold),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: MaidTable()),
            if (maidRegistrationCubit.state is MaidRegistrationLoading)
              CircularProgressIndicator(
                color: colorProject.primaryColor,
              ),
            if (maidRegistrationCubit.next != "0")
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorProject.primaryColor,
                ),
                onPressed: () {
                  maidRegistrationCubit.registerMaid("MAID_REGISTRATION_STATUS_APPROVED");
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

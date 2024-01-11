// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/maid_manage/controllers/maid_manage.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_cubit.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/components/filter_line.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveMaid extends StatefulWidget {
  const RemoveMaid({super.key, required this.maidID});

  final String maidID;

  @override
  State<RemoveMaid> createState() => _RemoveMaidState();
}

class _RemoveMaidState extends State<RemoveMaid> {
  TextEditingController reasonController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width / 1.2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width / 1.7
              : MediaQuery.of(context).size.width / 2.3,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilterLine(
              title: "Lí do gỡ vai trò giúp việc",
              info: reasonController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập lí do gỡ vai trò giúp việc';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ButtonBasic(
                text: "Gỡ giúp việc",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    showDialogWarning(
                      context: context,
                      message:
                          "Bạn có chắc chắn gỡ vai trò giúp việc của người dùng ${widget.maidID} ?",
                      btnOkOnPress: () async {
                        showCircleProgress(context);
                        try {
                          await MaidManageController().removeMaid(
                              widget.maidID, reasonController.text);
                          Navigator.pop(context);
                          showDialogSuccess(context, "Gỡ vai trò giúp việc thành công",
                              canPop: true);
                          context.read<MaidRegistrationCubit>().initState();
                          await context
                              .read<MaidRegistrationCubit>()
                              .registerMaid("MAID_REGISTRATION_STATUS_APPROVED");
                        } catch (e) {
                          Navigator.pop(context);
                          showDialogError(context, e.toString());
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
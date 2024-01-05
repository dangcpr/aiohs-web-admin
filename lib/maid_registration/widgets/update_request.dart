// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/maid_registration/controllers/maid.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_cubit.dart';
import 'package:aiohs_web_admin/maid_registration/widgets/update_request_field.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateMaidRequest extends StatefulWidget {
  const UpdateMaidRequest({super.key, required this.id});

  final String id;

  @override
  State<UpdateMaidRequest> createState() => _UpdateMaidRequestState();
}

class _UpdateMaidRequestState extends State<UpdateMaidRequest> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController reason = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UpdateMaidRequestField(
              reason: reason,
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ButtonBasic(
                text: "Gửi",
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  } else {
                    showDialogWarning(
                      context: context,
                      message:
                          "Bạn có chắc chắn muốn từ chối đơn đăng ký của người dùng ${widget.id}?",
                      btnOkOnPress: () async {
                        showCircleProgress(context);
                        try {
                          await MaidRegistrationController()
                              .upateMaidRegistration(widget.id, reason.text);
                          Navigator.pop(context);
                          showDialogSuccess(context, "Từ chối thành công", canPop: true);
                          await context
                              .read<MaidRegistrationCubit>()
                              .initState();
                          await context
                              .read<MaidRegistrationCubit>()
                              .registerMaid("MAID_REGISTRATION_STATUS_CREATED");
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

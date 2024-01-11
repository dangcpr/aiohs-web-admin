// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/job_posting/controllers/job_posting.dart';
import 'package:aiohs_web_admin/job_posting/cubits/get_job_posting/job_posting_cubit.dart';
import 'package:aiohs_web_admin/job_posting/models/job_posting.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/components/filter_line.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancelJob extends StatefulWidget {
  const CancelJob({super.key, required this.jobPosting});

  final JobPosting jobPosting;

  @override
  State<CancelJob> createState() => _CancelJobState();
}

class _CancelJobState extends State<CancelJob> {
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
              title: "Lí do hủy bài",
              info: reasonController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập lí do hủy bài';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ButtonBasic(
                text: "Hủy bài",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    showDialogWarning(
                      context: context,
                      message:
                          "Bạn có chắc chắn hủy bài viết ${widget.jobPosting.code} ?",
                      btnOkOnPress: () async {
                        showCircleProgress(context);
                        try {
                          await JobPostingController().cancelJob(
                              widget.jobPosting.code, reasonController.text);
                          Navigator.pop(context);
                          showDialogSuccess(context, "Hủy bài viết thành công",
                              canPop: true);
                          context.read<GetJobPostingCubit>().initState();
                          await context
                              .read<GetJobPostingCubit>()
                              .getJobPosting();
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

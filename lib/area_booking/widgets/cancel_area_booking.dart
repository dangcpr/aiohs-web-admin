// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/area_booking/controllers/area_booking.dart';
import 'package:aiohs_web_admin/area_booking/cubits/get_area_booking/get_area_booking_cubit.dart';
import 'package:aiohs_web_admin/area_booking/models/area_booking.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/components/filter_line.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancelAreaBooking extends StatefulWidget {
  const CancelAreaBooking({super.key, required this.areaBooking});

  final AreaBooking areaBooking;

  @override
  State<CancelAreaBooking> createState() => _CancelAreaBookingState();
}

class _CancelAreaBookingState extends State<CancelAreaBooking> {
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
            SizedBox(
              height: 85,
              child: FilterLine(
                title: "Lí do hủy bài",
                info: reasonController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập lí do hủy bài';
                  }
                  return null;
                },
              ),
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
                          "Bạn có chắc chắn hủy bài viết ${widget.areaBooking.code} ?",
                      btnOkOnPress: () async {
                        showCircleProgress(context);
                        try {
                          await AreaBookingController().cancelAreaBooking(
                              widget.areaBooking.code, reasonController.text);
                          Navigator.pop(context);
                          showDialogSuccess(context, "Hủy bài viết thành công", canPop: true);
                          context.read<GetAreaBookingCubit>().initState();
                          await context.read<GetAreaBookingCubit>().getAreaBooking();
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

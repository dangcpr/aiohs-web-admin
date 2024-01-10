// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/holiday/controllers/holiday.dart';
import 'package:aiohs_web_admin/holiday/cubits/get_holiday/get_holiday_cubit.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/components/filter_line.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUpdateHoliday extends StatefulWidget {
  const CreateUpdateHoliday({super.key, required this.cmd, this.id, this.date, this.name});

  final String cmd;
  final String? id;
  final String? date;
  final String? name;

  @override
  State<CreateUpdateHoliday> createState() => _CreateUpdateHolidayState();
}

class _CreateUpdateHolidayState extends State<CreateUpdateHoliday> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  DateTime date = DateTime.now();
  @override
  void initState() {
    super.initState();
    if(widget.cmd == "update"){
      dateController.text = widget.date!;
      nameController.text = widget.name!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width / 1.2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width / 1.7
              : MediaQuery.of(context).size.width / 2.3,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilterLine(
              title: "Ngày lễ",
              isReadOnly: true,
              info: dateController,
              validator: (value) {
                if(value!.isEmpty){
                  return "Ngày lễ không được để trống";
                }
                return null;
              },
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: colorProject.primaryColor,
                        ),
                        dialogBackgroundColor: Colors.white,
                      ),
                      child: child!,
                    );
                  },
                ).then((value) {
                  setState(() {
                    date = value!;
                  });
                  dateController.text =
                      "${value!.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}";
                });
              },
            ),
            FilterLine(
              title: "Tên ngày lễ",
              info: nameController,
              validator: (value) {
                if(value!.isEmpty){
                  return "Tên ngày lễ không được để trống";
                }
                return null;
              }
            ),
            Container(
              width: double.infinity,
              child: ButtonBasic(
                text: widget.cmd == "create" ? "Tạo" : "Cập nhật",
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    showCircleProgress(context);
                    if(widget.cmd == "create"){
                      try {
                        await HolidayController().createHoliday(
                          date: dateController.text,
                          name: nameController.text
                        );
                        await context.read<GetHolidaysCubit>().getHolidays(month: dateController.text.substring(0, 7));
                        Navigator.pop(context);
                        showDialogSuccess(context, "Tạo ngày lễ thành công", canPop: true);
                      } catch (e) {
                        Navigator.pop(context);
                        showDialogError(context, e.toString());
                      }
                    } else {
                      try {
                        await HolidayController().updateHoliday(
                          id: widget.id!,
                          date: dateController.text,
                          name: nameController.text
                        );
                        await context.read<GetHolidaysCubit>().getHolidays(month: dateController.text.substring(0, 7));
                        Navigator.pop(context);
                        showDialogSuccess(context, "Cập nhật ngày lễ thành công", canPop: true);
                      } catch (e) {
                        Navigator.pop(context);
                        showDialogError(context, e.toString());
                      }
                    }
                  }
                },
              )
            )
          ],
        ),
      ),
    );
  }
}

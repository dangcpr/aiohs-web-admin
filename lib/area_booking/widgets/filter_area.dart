import 'package:aiohs_web_admin/area_booking/constants/status_area.dart';
import 'package:aiohs_web_admin/area_booking/constants/type_area.dart';
import 'package:aiohs_web_admin/area_booking/cubits/get_area_booking/get_area_booking_cubit.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/components/filter_line.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterAreaBooking extends StatefulWidget {
  const FilterAreaBooking({super.key});

  @override
  State<FilterAreaBooking> createState() => _FilterAreaBookingState();
}

class _FilterAreaBookingState extends State<FilterAreaBooking> {
  TextEditingController searchUserController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  String? status;
  String? type;
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  int _value1 = 0;
  int _value2 = 0;

  @override
  void initState() {
    super.initState();
    fromDateController.text = from_date_default;
    toDateController.text =
        "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width / 1.2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width / 1.7
              : MediaQuery.of(context).size.width / 2.3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterLine(
            title: "Tìm kiếm User (theo code)",
            info: searchUserController,
          ),
          FilterLine(
            title: "Tạo từ ngày",
            isReadOnly: true,
            info: fromDateController,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: fromDate,
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
              ).then(
                (value) {
                  setState(() {
                    fromDate = value!;
                  });
                  fromDateController.text =
                      "${value!.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}";
                },
              );
            },
          ),
          FilterLine(
            title: "Tạo đến ngày",
            info: toDateController,
            isReadOnly: true,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: toDate,
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
                  toDate = value!;
                });
                toDateController.text =
                    "${value!.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}";
              });
            },
          ),
          statusChoice(),
          typeChoice(),
          Container(
            width: double.infinity,
            child: ButtonBasic(
              text: "Lọc",
              onPressed: () async {
                Navigator.pop(context);
                context.read<GetAreaBookingCubit>().initState();
                await context.read<GetAreaBookingCubit>().getAreaBooking(
                      from_date: fromDateController.text,
                      to_date: toDateController.text,
                      status: status,
                      user_code: searchUserController.text,
                      type: type,
                    );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget statusChoice() {
    return !Responsive.isMobile(context)
        ? SizedBox(
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SelectableText("Vai trò")),
                Wrap(
                  spacing: 6.0,
                  children: List<Widget>.generate(
                    statusAreas.length,
                    (int index) {
                      return ChoiceChip(
                        label: Text(statusAreas[index].status_display),
                        selected: _value1 == index,
                        selectedColor: MaterialStateColor.resolveWith(
                            (states) =>
                                colorProject.primaryColor.withOpacity(0.4)),
                        onSelected: (bool selected) {
                          setState(() {
                            status = statusAreas[index].status;
                            debugPrint(status);
                            _value1 = selected ? index : 0;
                          });
                        },
                      );
                    },
                  ).toList(),
                )
              ],
            ),
          )
        : SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText("Trạng thái bài cho thuê"),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 6.0,
                    //alignment: WrapAlignment.spaceBetween,
                    children: List<Widget>.generate(
                      statusAreas.length,
                      (int index) {
                        return ChoiceChip(
                          label: Text(statusAreas[index].status_display),
                          selected: _value1 == index,
                          selectedColor: MaterialStateColor.resolveWith(
                              (states) =>
                                  colorProject.primaryColor.withOpacity(0.4)),
                          onSelected: (bool selected) {
                            setState(() {
                              status = statusAreas[index].status;
                              _value1 = selected ? index : 0;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          );
  }

  Widget typeChoice() {
    return !Responsive.isMobile(context)
        ? SizedBox(
            height: 85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SelectableText("Loại bài viết")),
                Wrap(
                  spacing: 6.0,
                  children: List<Widget>.generate(
                    typeAreas.length,
                    (int index) {
                      return ChoiceChip(
                        label: Text(typeAreas[index].type_display),
                        selected: _value2 == index,
                        selectedColor: MaterialStateColor.resolveWith(
                            (states) =>
                                colorProject.primaryColor.withOpacity(0.4)),
                        onSelected: (bool selected) {
                          setState(() {
                            type = typeAreas[index].type;
                            debugPrint(type);
                            _value2 = selected ? index : 0;
                          });
                        },
                      );
                    },
                  ).toList(),
                )
              ],
            ),
          )
        : SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText("Vai trò"),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 6.0,
                    //alignment: WrapAlignment.spaceBetween,
                    children: List<Widget>.generate(
                      typeAreas.length,
                      (int index) {
                        return ChoiceChip(
                          label: Text(typeAreas[index].type_display),
                          selected: _value2 == index,
                          selectedColor: MaterialStateColor.resolveWith(
                              (states) =>
                                  colorProject.primaryColor.withOpacity(0.4)),
                          onSelected: (bool selected) {
                            setState(() {
                              type = typeAreas[index].type;
                              _value2 = selected ? index : 0;
                            });
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          );
  }
}

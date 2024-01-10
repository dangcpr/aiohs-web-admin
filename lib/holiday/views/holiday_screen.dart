import 'package:aiohs_web_admin/holiday/cubits/get_holiday/get_holiday_cubit.dart';
import 'package:aiohs_web_admin/holiday/widgets/create_update_holiday.dart';
import 'package:aiohs_web_admin/holiday/widgets/holiday_table.dart';
import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/text_field.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({super.key});

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    searchMonth.text =
        "${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}";
    context.read<GetHolidaysCubit>().initState();
    context.read<GetHolidaysCubit>().getHolidays();
  }

  TextEditingController searchMonth = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Ngày lễ",
      color: Colors.white,
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        appBar: AppBar(
          title: SelectableText("Ngày lễ",
              style: TextStyle(fontFamily: fontFamilyBold)),
          actions: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tạo ngày lễ",
                          style: TextStyle(
                            fontFamily: fontFamilyBold,
                            fontSize: fontSize.large,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    content: CreateUpdateHoliday(cmd: "create"),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: colorProject.primaryColor,
                  ),
                  Text(
                    "Tạo ngày lễ",
                    style: TextStyle(
                      fontFamily: fontFamilyBold,
                      fontSize: fontSize.mediumLarger,
                      color: colorProject.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: 300,
                child: TextFieldBasic(
                  controller: searchMonth,
                  label: "Tìm kiếm theo năm-tháng (yyyy-mm)",
                  isReadOnly: true,
                  onTap: () {
                    showMonthPicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 5),
                      lastDate: DateTime(DateTime.now().year + 5),
                      selectedMonthBackgroundColor: colorProject.primaryColor,
                      selectedMonthTextColor: Colors.white,
                      unselectedMonthTextColor: colorProject.primaryColor,
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          searchMonth.text =
                              "${value.year.toString().padLeft(4, '0')}-${value.month.toString().padLeft(2, '0')}";
                        });
                        context
                            .read<GetHolidaysCubit>()
                            .getHolidays(month: searchMonth.text);
                      }
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: HolidayTable(),
            )
          ],
        ),
      ),
    );
  }
}

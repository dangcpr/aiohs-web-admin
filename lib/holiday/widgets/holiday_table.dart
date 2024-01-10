import 'package:aiohs_web_admin/holiday/controllers/holiday.dart';
import 'package:aiohs_web_admin/holiday/cubits/get_holiday/get_holiday_cubit.dart';
import 'package:aiohs_web_admin/holiday/cubits/get_holiday/get_holiday_state.dart';
import 'package:aiohs_web_admin/holiday/widgets/create_update_holiday.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HolidayTable extends StatefulWidget {
  const HolidayTable({super.key});

  @override
  State<HolidayTable> createState() => _HolidayTableState();
}

class _HolidayTableState extends State<HolidayTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: BlocBuilder(
        bloc: context.read<GetHolidaysCubit>(),
        builder: (context, state) {
          if (state is GetHolidaysLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetHolidaysSuccess) {
            return DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 800,
              sortArrowBuilder: (asc, _) => Icon(
                asc ? Icons.arrow_downward : Icons.arrow_upward,
                size: 18,
              ),
              empty: Text("Không có dữ liệu"),
              headingTextStyle: TextStyle(
                fontFamily: fontFamilyBold,
              ),
              columns: [
                DataColumn(label: Text("ID", softWrap: true)),
                DataColumn(label: Text("Ngày lễ (yyyy-mm-dd)", softWrap: true)),
                DataColumn(label: Text("Tên ngày lễ", softWrap: true)),
                DataColumn(label: Text("Thao tác", softWrap: true)),
              ],
              rows: List.generate(
                state.holidays.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Text(state.holidays[index].id.toString())),
                    DataCell(Text(state.holidays[index].date)),
                    DataCell(Text(state.holidays[index].name)),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    "Cập nhật ngày lễ",
                                    style: TextStyle(
                                      fontFamily: fontFamilyBold,
                                    ),
                                  ),
                                  content: CreateUpdateHoliday(
                                    cmd: "update",
                                    id: state.holidays[index].id.toString(),
                                    date: state.holidays[index].date,
                                    name: state.holidays[index].name,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit),
                            tooltip: "Cập nhật ngày lễ",
                          ),
                          IconButton(
                            onPressed: () {
                              showDialogWarning(
                                context: context,
                                message: "Bạn muốn hủy ngày lễ: " +
                                    state.holidays[index].name,
                                btnOkOnPress: () async {
                                  showCircleProgress(context);
                                  try {
                                    await HolidayController().deleteHoliday(
                                      id: state.holidays[index].id.toString(),
                                    );
                                    Navigator.pop(context);
                                    context
                                        .read<GetHolidaysCubit>()
                                        .getHolidays();
                                    showDialogSuccess(
                                        context, "Hủy ngày lễ thành công");
                                  } catch (e) {
                                    Navigator.pop(context);
                                    showDialogError(context, e.toString());
                                  }
                                },
                              );
                            },
                            icon: Icon(Icons.delete),
                            tooltip: "Hủy ngày lễ",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is GetHolidaysFailure) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}

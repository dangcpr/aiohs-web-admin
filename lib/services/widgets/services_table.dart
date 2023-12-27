import 'package:aiohs_web_admin/services/cubits/get_service/get_service_cubit.dart';
import 'package:aiohs_web_admin/services/cubits/get_service/get_service_state.dart';
import 'package:aiohs_web_admin/services/helpers/show_dialog_price.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceTable extends StatefulWidget {
  const ServiceTable({super.key});

  @override
  State<ServiceTable> createState() => _ServiceTableState();
}

class _ServiceTableState extends State<ServiceTable> {
  bool ascending = false;
  @override
  Widget build(BuildContext conSelectableText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: BlocBuilder(
        bloc: context.watch<GetServiceCubit>(),
        builder: (context, state) {
          if (state is GetServiceLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: colorProject.primaryColor,
              ),
            );
          } else if (state is GetServiceSuccess) {
            return DataTable2(
              sortAscending: ascending,
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 800,
              sortArrowBuilder: (asc, _) => Icon(
                asc ? Icons.arrow_downward : Icons.arrow_upward,
                size: 18,
              ),
              headingTextStyle: TextStyle(
                fontFamily: fontFamilyBold,
              ),
              columns: [
                DataColumn2(label: SelectableText("ID"), fixedWidth: 40),
                DataColumn(label: SelectableText("Mã dịch vụ")),
                DataColumn(label: SelectableText("Tên dịch vụ")),
                DataColumn2(label: SelectableText("Mô tả")),
                DataColumn2(label: SelectableText("Loại"), fixedWidth: 80),
                DataColumn2(
                    label: SelectableText("Trạng thái"), fixedWidth: 80),
                DataColumn2(label: SelectableText("Thao tác"), fixedWidth: 60)
              ],
              rows: List<DataRow>.generate(
                state.services.length,
                (index) => DataRow(
                  cells: [
                    DataCell(SelectableText((index + 1).toString())),
                    DataCell(SelectableText(state.services[index].code)),
                    DataCell(SelectableText(state.services[index].title)),
                    DataCell(SelectableText(state.services[index].name)),
                    DataCell(SelectableText(state.services[index].type)),
                    DataCell(SelectableText(state.services[index].status)),
                    DataCell(Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialogPrice(
                              state.services[index].code,
                              state.services[index].name,
                              state.services[index].title,
                              state.services[index].icon_url,
                              context,
                            );
                          },
                          icon: Icon(
                            Icons.edit_rounded,
                            color: colorProject.primaryColor,
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            );
          } else if (state is GetServiceFailure) {
            return Center(
              child: SelectableText(state.error),
            );
          } else {
            return Center(
              child: SelectableText("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}

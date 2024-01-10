import 'package:aiohs_web_admin/area_booking/cubits/get_area_booking/get_area_booking_cubit.dart';
import 'package:aiohs_web_admin/area_booking/cubits/get_area_booking/get_area_booking_state.dart';
import 'package:aiohs_web_admin/area_booking/widgets/cancel_area_booking.dart';
import 'package:aiohs_web_admin/area_booking/widgets/detail_and_images.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaBookingTable extends StatefulWidget {
  const AreaBookingTable({super.key});

  @override
  State<AreaBookingTable> createState() => _AreaBookingTableState();
}

class _AreaBookingTableState extends State<AreaBookingTable> {
  @override
  Widget build(BuildContext context) {
    var getAreaBooking = context.watch<GetAreaBookingCubit>();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 1000,
        dataRowHeight: 100,
        headingRowHeight: 80,
        empty: getAreaBooking.state is GetAreaBookingFailure
            ? Text((getAreaBooking.state as GetAreaBookingFailure).error)
            : (getAreaBooking.state is GetAreaBookingLoading
                ? Text('Đang tải ...')
                : Text('Không có dữ liệu')),
        headingTextStyle: TextStyle(
          fontFamily: fontFamilyBold,
          color: isDark ? Colors.white : Colors.black,
        ),
        columns: const [
          DataColumn2(
              label: Text('Mã bài viết', softWrap: true), fixedWidth: 90),
          DataColumn2(
              label: Text('Mã người dùng đăng bài', softWrap: true),
              fixedWidth: 100),
          DataColumn2(
              label: Text('Loại bài viết', softWrap: true), fixedWidth: 90),
          DataColumn2(
              label: Text('Trạng thái', softWrap: true), fixedWidth: 90),
          DataColumn2(
              label: Text('Chi tiết + Hình ảnh chỗ thuê', softWrap: true),
              fixedWidth: 120),
          DataColumn(label: Text('Địa chỉ', softWrap: true)),
          DataColumn2(
              label: Text('Ngày tạo bài viết', softWrap: true),
              fixedWidth: 100),
          DataColumn2(
              label: Text('Ngày cập nhật cuối cùng', softWrap: true),
              fixedWidth: 100),
          DataColumn2(label: Text('Thao tác', softWrap: true), fixedWidth: 80),
        ],
        rows: [
          for (var area in getAreaBooking.areaBookingList)
            DataRow(cells: [
              DataCell(Text(area.code == '' ? '(trống)' : area.code)),
              DataCell(Text(area.user_code == '' ? '(trống)' : area.user_code)),
              DataCell(Text(area.type == '' ? '(trống)' : area.type_display)),
              DataCell(
                  Text(area.status == '' ? '(trống)' : area.status_display)),
              DataCell(
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        scrollable: true,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Chi tiết + Hình ảnh chỗ thuê",
                                style: TextStyle(
                                  fontFamily: fontFamilyBold,
                                  fontSize: fontSize.large,
                                ),
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
                        content: DetailAndImageArea(areaBooking: area),
                      ),
                    );
                  },
                  child: Text('Xem chi tiết'),
                ),
              ),
              DataCell(Text(area.address == '' ? '(trống)' : area.address)),
              DataCell(
                  Text(area.created_at == '' ? '(trống)' : area.created_at)),
              DataCell(
                  Text(area.updated_at == '' ? '(trống)' : area.updated_at)),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Hủy bài cho thuê chỗ',
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            scrollable: true,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Hủy bài viết",
                                    style: TextStyle(
                                      fontFamily: fontFamilyBold,
                                      fontSize: fontSize.large,
                                    ),
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
                            content: CancelAreaBooking(areaBooking: area),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ]),
        ],
      ),
    );
  }
}

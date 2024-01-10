import 'package:aiohs_web_admin/area_booking/cubits/get_area_booking/get_area_booking_cubit.dart';
import 'package:aiohs_web_admin/area_booking/cubits/get_area_booking/get_area_booking_state.dart';
import 'package:aiohs_web_admin/area_booking/widgets/area_booking_table.dart';
import 'package:aiohs_web_admin/area_booking/widgets/filter_area.dart';
import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaBookingScreen extends StatefulWidget {
  const AreaBookingScreen({super.key});

  @override
  State<AreaBookingScreen> createState() => _AreaBookingScreenState();
}

class _AreaBookingScreenState extends State<AreaBookingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetAreaBookingCubit>().initState();
    context.read<GetAreaBookingCubit>().getAreaBooking();
  }
  @override
  Widget build(BuildContext context) {
    var getAreaBookingCubit = context.watch<GetAreaBookingCubit>();
    return Title(
      title: "Tin thuê chỗ",
      color: Colors.white,
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        appBar: AppBar(
          title: SelectableText(
            "Tin thuê chỗ",
            style: TextStyle(fontFamily: fontFamilyBold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    scrollable: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bộ lọc",
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
                    content: FilterAreaBooking(),
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.filter_alt_outlined,
                    color: colorProject.primaryColor,
                  ),
                  Text(
                    "Bộ lọc",
                    style: TextStyle(
                      color: colorProject.primaryColor,
                      fontFamily: fontFamilyBold,
                      fontSize: fontSize.mediumLarger,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(child: AreaBookingTable()),
            if (getAreaBookingCubit.state is GetAreaBookingLoading)
              CircularProgressIndicator(
                color: colorProject.primaryColor,
              ),
            if (getAreaBookingCubit.next != "0")
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorProject.primaryColor,
                ),
                onPressed: () {
                  getAreaBookingCubit.getAreaBooking();
                },
                child: Text("Tải thêm dữ liệu",
                    style: TextStyle(color: Colors.white)),
              ),
            SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}

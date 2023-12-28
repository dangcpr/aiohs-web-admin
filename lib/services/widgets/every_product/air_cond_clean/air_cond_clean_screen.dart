// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/services/controllers/update.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/air_cond_clean/air_cond_price_cubit.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/air_cond_clean/air_cond_price_state.dart';
import 'package:aiohs_web_admin/services/cubits/get_service/get_service_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/price_line.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirCondPriceScreen extends StatefulWidget {
  const AirCondPriceScreen(
      {super.key,
      required this.name,
      required this.title,
      required this.icon_url});

  final String name;
  final String title;
  final String icon_url;

  @override
  State<AirCondPriceScreen> createState() => _AirCondPriceScreenState();
}

class _AirCondPriceScreenState extends State<AirCondPriceScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetAirCondCleanPriceCubit>().getAirCondCleanPrice();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController bringToolController = TextEditingController();
  TextEditingController onPeakDateController = TextEditingController();
  TextEditingController onPeakHourController = TextEditingController();
  TextEditingController onWeekendController = TextEditingController();
  TextEditingController onHolidayController = TextEditingController();
  TextEditingController wall_Above2HPController = TextEditingController();
  TextEditingController wall_Bellow2HPController = TextEditingController();
  TextEditingController wall_GasRefillController = TextEditingController();
  TextEditingController portal_PortableController = TextEditingController();
  TextEditingController portal_GasRefillController = TextEditingController();
  TextEditingController cassette_Bellow3HPController = TextEditingController();
  TextEditingController cassette_Above3HPController = TextEditingController();
  TextEditingController cassette_GasRefillController = TextEditingController();
  TextEditingController floor_Bellow5HPController = TextEditingController();
  TextEditingController floor_Above5HPController = TextEditingController();
  TextEditingController floor_GasRefillController = TextEditingController();
  TextEditingController built_in_BuiltInController = TextEditingController();
  TextEditingController built_in_GasRefillController = TextEditingController();

  int loading = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width / 1.2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width / 1.7
              : MediaQuery.of(context).size.width / 2.2,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        child: BlocBuilder(
          bloc: context.read<GetAirCondCleanPriceCubit>(),
          builder: (context, state) {
            if (state is GetAirCondCleanPriceLoading) {
              debugPrint("Loading");
              return Center(
                  child: CircularProgressIndicator(
                color: colorProject.primaryColor,
              ));
            } else if (state is GetAirCondCleanPriceSuccess) {
              debugPrint("Success");
              var formKey = GlobalKey<FormState>();
              titleController.text = widget.title;
              nameController.text = widget.name;
              unitPriceController.text =
                  state.airCondCleanPrice.unit_price.toString();
              discountController.text =
                  state.airCondCleanPrice.discount.toString();
              bringToolController.text =
                  state.airCondCleanPrice.bring_tools.toString();
              onPeakDateController.text =
                  state.airCondCleanPrice.on_peak_date.toString();
              onPeakHourController.text =
                  state.airCondCleanPrice.on_peak_hour.toString();
              onWeekendController.text =
                  state.airCondCleanPrice.on_weekend.toString();
              onHolidayController.text =
                  state.airCondCleanPrice.on_holiday.toString();
              wall_Above2HPController.text =
                  state.airCondCleanPrice.wall_Above2HP.toString();
              wall_Bellow2HPController.text =
                  state.airCondCleanPrice.wall_Bellow2HP.toString();
              wall_GasRefillController.text =
                  state.airCondCleanPrice.wall_GasRefill.toString();
              portal_PortableController.text =
                  state.airCondCleanPrice.portal_Portable.toString();
              portal_GasRefillController.text =
                  state.airCondCleanPrice.portal_GasRefill.toString();
              cassette_Bellow3HPController.text =
                  state.airCondCleanPrice.cassette_Bellow3HP.toString();
              cassette_Above3HPController.text =
                  state.airCondCleanPrice.cassette_Above3HP.toString();
              cassette_GasRefillController.text =
                  state.airCondCleanPrice.cassette_GasRefill.toString();
              floor_Bellow5HPController.text =
                  state.airCondCleanPrice.floor_Bellow5HP.toString();
              floor_Above5HPController.text =
                  state.airCondCleanPrice.floor_Above5HP.toString();
              floor_GasRefillController.text =
                  state.airCondCleanPrice.floor_GasRefill.toString();
              built_in_BuiltInController.text =
                  state.airCondCleanPrice.built_in_BuiltIn.toString();
              built_in_GasRefillController.text =
                  state.airCondCleanPrice.built_in_GasRefill.toString();

              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SelectableText(
                      "Chỉnh sửa giá dịch vụ giặt ủi bên dưới",
                      style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: fontSize.medium,
                      ),
                    ),
                    SizedBox(height: 10),
                    PriceLine(
                      title: "Tên dịch vụ",
                      price: titleController,
                      isNumeric: false,
                    ),
                    PriceLine(
                      title: "Mô tả",
                      price: nameController,
                      isNumeric: false,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa treo tường - Above 2HP (VNĐ)",
                      price: wall_Above2HPController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa treo tường - Bellow 2HP (VNĐ)",
                      price: wall_Bellow2HPController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa treo tường - Gas Refill (VNĐ)",
                      price: wall_GasRefillController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa cục bộ - Portable (VNĐ)",
                      price: portal_PortableController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa cục bộ - Gas Refill (VNĐ)",
                      price: portal_GasRefillController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa âm trần - Bellow 3HP (VNĐ)",
                      price: cassette_Bellow3HPController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa âm trần - Above 3HP (VNĐ)",
                      price: cassette_Above3HPController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa âm trần - Gas Refill (VNĐ)",
                      price: cassette_GasRefillController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa đứng - Bellow 5HP (VNĐ)",
                      price: floor_Bellow5HPController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa đứng - Above 5HP (VNĐ)",
                      price: floor_Above5HPController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa đứng - Gas Refill (VNĐ)",
                      price: floor_GasRefillController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa âm tủ - BuiltIn (VNĐ)",
                      price: built_in_BuiltInController,
                    ),
                    PriceLine(
                      title: "Giá sửa điều hòa âm tủ - Gas Refill (VNĐ)",
                      price: built_in_GasRefillController,
                    ),
                    PriceLine(
                      price: discountController,
                      title: "Giảm giá (%)",
                    ),
                    PriceLine(
                      price: onPeakDateController,
                      title: "Phụ thu ngày cao điểm (VNĐ)",
                    ),
                    PriceLine(
                      price: onPeakHourController,
                      title: "Phụ thu ngoài giờ làm việc (VNĐ)",
                    ),
                    PriceLine(
                      price: onWeekendController,
                      title: "Phụ thu ngày cuối tuần (VNĐ)",
                    ),
                    PriceLine(
                      price: onHolidayController,
                      title: "Phụ thu ngày lễ (VNĐ)",
                    ),
                    loading == 0
                        ? Container(
                            height: 40,
                            child: ButtonBasic(
                                text: "Cập nhật",
                                onPressed: () async {
                                  debugPrint(widget.icon_url);
                                  if (formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = 1;
                                    });
                                    try {
                                      await UpdateServiceController()
                                          .updateAirCondCleanPrice(
                                        title: titleController.text,
                                        name: nameController.text,
                                        icon_url: widget.icon_url,
                                        unit_price: double.tryParse(
                                            unitPriceController.text)!,
                                        discount: double.tryParse(
                                            discountController.text)!,
                                        bring_tools: double.tryParse(
                                            bringToolController.text)!,
                                        on_peak_date: double.tryParse(
                                            onPeakDateController.text)!,
                                        on_peak_hour: double.tryParse(
                                            onPeakHourController.text)!,
                                        on_weekend: double.tryParse(
                                            onWeekendController.text)!,
                                        on_holiday: double.tryParse(
                                            onHolidayController.text)!,
                                        wall_Above2HP: double.tryParse(
                                            wall_Above2HPController.text)!,
                                        wall_Bellow2HP: double.tryParse(
                                            wall_Bellow2HPController.text)!,
                                        wall_GasRefill: double.tryParse(
                                            wall_GasRefillController.text)!,
                                        portal_Portable: double.tryParse(
                                            portal_PortableController.text)!,
                                        portal_GasRefill: double.tryParse(
                                            portal_GasRefillController.text)!,
                                        cassette_Bellow3HP: double.tryParse(
                                            cassette_Bellow3HPController.text)!,
                                        cassette_Above3HP: double.tryParse(
                                            cassette_Above3HPController.text)!,
                                        cassette_GasRefill: double.tryParse(
                                            cassette_GasRefillController.text)!,
                                        floor_Bellow5HP: double.tryParse(
                                            floor_Bellow5HPController.text)!,
                                        floor_Above5HP: double.tryParse(
                                            floor_Above5HPController.text)!,
                                        floor_GasRefill: double.tryParse(
                                            floor_GasRefillController.text)!,
                                        built_in_BuiltIn: double.tryParse(
                                            built_in_BuiltInController.text)!,
                                        built_in_GasRefill: double.tryParse(
                                            built_in_GasRefillController.text)!,
                                      );
                                      setState(() {
                                        loading = 0;
                                      });
                                      await context
                                          .read<GetServiceCubit>()
                                          .getService();
                                      AwesomeDialog(
                                        dismissOnBackKeyPress: false,
                                        dismissOnTouchOutside: false,
                                        width: Responsive.isMobile(context)
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1
                                            : Responsive.isTablet(context)
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.5,
                                        context: context,
                                        dialogType: DialogType.success,
                                        animType: AnimType.bottomSlide,
                                        title: 'Thành công',
                                        desc: 'Cập nhật giá dịch vụ thành công',
                                        btnOkOnPress: () {
                                          Navigator.pop(context);
                                        },
                                      ).show();
                                    } catch (e) {
                                      setState(() {
                                        loading = 0;
                                      });
                                      AwesomeDialog(
                                        width: Responsive.isMobile(context)
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1
                                            : Responsive.isTablet(context)
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.5,
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.bottomSlide,
                                        title: 'Thất bại',
                                        desc: e.toString(),
                                        btnOkOnPress: () {},
                                      ).show();
                                    }
                                  }
                                }),
                          )
                        : Container(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: null,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              );
            } else if (state is GetAirCondCleanPriceFailure) {
              debugPrint("Failure");
              return Center(child: Text(state.error));
            }
            debugPrint("Initial");
            return Container();
          },
        ),
      ),
    );
  }
}

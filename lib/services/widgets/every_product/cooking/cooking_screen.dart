// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/services/controllers/update.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/cooking/cooking_price_cubit.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/cooking/cooking_price_state.dart';
import 'package:aiohs_web_admin/services/cubits/get_service/get_service_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/price_line.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CookingPriceScreen extends StatefulWidget {
  const CookingPriceScreen(
      {super.key,
      required this.name,
      required this.title,
      required this.icon_url});

  final String name;
  final String title;
  final String icon_url;

  @override
  State<CookingPriceScreen> createState() => _CookingPriceScreenState();
}

class _CookingPriceScreenState extends State<CookingPriceScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetCookingPriceCubit>().getCookingPrice();
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

  int loading = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width / 1.2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width / 1.7
              : MediaQuery.of(context).size.width / 2.2,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        child: BlocBuilder(
          bloc: context.watch<GetCookingPriceCubit>(),
          builder: (context, state) {
            if (state is GetCookingPriceLoading) {
              return Center(
                  child: CircularProgressIndicator(
                color: colorProject.primaryColor,
              ));
            } else if (state is GetCookingPriceSuccess) {
              var formKey = GlobalKey<FormState>();
              titleController.text = widget.title;
              nameController.text = widget.name;
              unitPriceController.text =
                  state.cookingPrice.unit_price.toString();
              discountController.text =
                  state.cookingPrice.discount.toString();
              bringToolController.text =
                  state.cookingPrice.bring_tools.toString();
              onPeakDateController.text =
                  state.cookingPrice.on_peak_date.toString();
              onPeakHourController.text =
                  state.cookingPrice.on_peak_hour.toString();
              onWeekendController.text =
                  state.cookingPrice.on_weekend.toString();
              onHolidayController.text =
                  state.cookingPrice.on_holiday.toString();

              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SelectableText(
                      "Chỉnh sửa giá dịch vụ nấu ăn gia đình bên dưới",
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
                      price: unitPriceController,
                      title: "Đơn giá (trên người - VNĐ)",
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
                                          .updateCooking(
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
                                      );
                                      setState(() {
                                        loading = 0;
                                      });
                                      await context.read<GetServiceCubit>().getService();
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
            } else if (state is GetCookingPriceFailure) {
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

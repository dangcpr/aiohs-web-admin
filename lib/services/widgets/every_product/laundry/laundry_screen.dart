// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/services/controllers/update.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/laundry/laundry_price_cubit.dart';
import 'package:aiohs_web_admin/services/cubits/every_service/laundry/laundry_price_state.dart';
import 'package:aiohs_web_admin/services/cubits/get_service/get_service_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/price_line.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryPriceScreen extends StatefulWidget {
  const LaundryPriceScreen(
      {super.key,
      required this.name,
      required this.title,
      required this.icon_url});

  final String name;
  final String title;
  final String icon_url;

  @override
  State<LaundryPriceScreen> createState() => _LaundryPriceScreenState();
}

class _LaundryPriceScreenState extends State<LaundryPriceScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetLaundryPriceCubit>().getLaundryPrice();
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
  TextEditingController clothesController = TextEditingController();
  TextEditingController blanketController = TextEditingController();
  TextEditingController mosquitoNetController = TextEditingController();
  TextEditingController netController = TextEditingController();
  TextEditingController draperyController = TextEditingController();
  TextEditingController topperController = TextEditingController();
  TextEditingController pillowController = TextEditingController();
  TextEditingController complexController = TextEditingController();
  TextEditingController vietnamDressController = TextEditingController();
  TextEditingController weedingDressController = TextEditingController();
  TextEditingController bleachingController = TextEditingController();
  TextEditingController clothesController_kg = TextEditingController();
  TextEditingController blanketController_kg = TextEditingController();
  TextEditingController mosquitoNetController_kg = TextEditingController();
  TextEditingController netController_kg = TextEditingController();
  TextEditingController draperyController_kg = TextEditingController();
  TextEditingController topperController_kg = TextEditingController();
  TextEditingController pillowController_kg = TextEditingController();
  TextEditingController complexController_kg = TextEditingController();
  TextEditingController vietnamDressController_kg = TextEditingController();
  TextEditingController weedingDressController_kg = TextEditingController();
  TextEditingController bleachingController_kg = TextEditingController();

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
          bloc: context.read<GetLaundryPriceCubit>(),
          builder: (context, state) {
            if (state is GetLaundryPriceLoading) {
              debugPrint("Loading");
              return Center(
                  child: CircularProgressIndicator(
                color: colorProject.primaryColor,
              ));
            } else if (state is GetLaundryPriceSuccess) {
              debugPrint("Success");
              var formKey = GlobalKey<FormState>();
              titleController.text = widget.title;
              nameController.text = widget.name;
              unitPriceController.text =
                  state.laundryPrice.unit_price.toString();
              discountController.text = state.laundryPrice.discount.toString();
              bringToolController.text =
                  state.laundryPrice.bring_tools.toString();
              onPeakDateController.text =
                  state.laundryPrice.onPeakDate.toString();
              onPeakHourController.text =
                  state.laundryPrice.onPeakHour.toString();
              onWeekendController.text =
                  state.laundryPrice.onWeekend.toString();
              onHolidayController.text =
                  state.laundryPrice.onHoliday.toString();
              clothesController.text = state.laundryPrice.clothes.toString();
              blanketController.text = state.laundryPrice.blanket.toString();
              mosquitoNetController.text =
                  state.laundryPrice.mosquito.toString();
              netController.text = state.laundryPrice.net.toString();
              draperyController.text = state.laundryPrice.drap.toString();
              topperController.text = state.laundryPrice.topper.toString();
              pillowController.text = state.laundryPrice.pillow.toString();
              complexController.text = state.laundryPrice.comple.toString();
              vietnamDressController.text =
                  state.laundryPrice.vietnamDress.toString();
              weedingDressController.text =
                  state.laundryPrice.weedingDress.toString();
              bleachingController.text =
                  state.laundryPrice.bleaching.toString();
              clothesController_kg.text =
                  state.laundryPrice.clothes_k.toString();
              blanketController_kg.text =
                  state.laundryPrice.blanket_k.toString();
              mosquitoNetController_kg.text =
                  state.laundryPrice.mosquito_k.toString();
              netController_kg.text = state.laundryPrice.net_k.toString();
              draperyController_kg.text = state.laundryPrice.drap_k.toString();
              topperController_kg.text = state.laundryPrice.topper_k.toString();
              pillowController_kg.text = state.laundryPrice.pillow_k.toString();
              complexController_kg.text =
                  state.laundryPrice.comple_k.toString();
              vietnamDressController_kg.text =
                  state.laundryPrice.vietnamDress_k.toString();
              weedingDressController_kg.text =
                  state.laundryPrice.weedingDress_k.toString();
              bleachingController_kg.text =
                  state.laundryPrice.bleaching_k.toString();

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
                      title: "Giá giặt ủi thông thường (bộ - VNĐ)",
                      price: clothesController,
                    ),
                    PriceLine(
                      title: "Giá giặt chăn/mềm (bộ - VNĐ)",
                      price: blanketController,
                    ),
                    PriceLine(
                      title: "Giá giặt trải giường (bộ - VNĐ)",
                      price: topperController,
                    ),
                    PriceLine(
                      title: "Giá giặt gối (cái - VNĐ)",
                      price: pillowController,
                    ),
                    PriceLine(
                      title: "Giá giặt drap giường (cái - VNĐ)",
                      price: draperyController,
                    ),
                    PriceLine(
                      title: "Giá giặt lưới chống muỗi (cái - VNĐ)",
                      price: netController,
                    ),
                    PriceLine(
                      title: "Giá giặt mùng chống muỗi (cái - VNĐ)",
                      price: mosquitoNetController,
                    ),
                    PriceLine(
                      title: "Giá giặt đồ com-lê (cái - VNĐ)",
                      price: complexController,
                    ),
                    PriceLine(
                      title: "Giá giặt áo dài Việt Nam (cái - VNĐ)",
                      price: vietnamDressController,
                    ),
                    PriceLine(
                      title: "Giá giặt áo cưới (cái - VNĐ)",
                      price: weedingDressController,
                    ),
                    PriceLine(
                      title: "Giá tẩy trắng (bộ - VNĐ)",
                      price: bleachingController,
                    ),
                    PriceLine(
                      title: "Giá giặt ủi thông thường (kg - VNĐ)",
                      price: clothesController_kg,
                    ),
                    PriceLine(
                      title: "Giá giặt chăn/mềm (kg - VNĐ)",
                      price: blanketController_kg,
                    ),
                    PriceLine(
                      title: "Giá giặt trải giường (kg - VNĐ)",
                      price: topperController_kg,
                    ),
                    PriceLine(
                      title: "Giá giặt gối (kg - VNĐ)",
                      price: pillowController_kg,
                    ),
                    PriceLine(
                      title: "Giá giặt drap giường (kg - VNĐ)",
                      price: draperyController_kg,
                    ),
                    PriceLine(
                      title: "Giá giặt lưới chống muỗi (kg - VNĐ)",
                      price: netController_kg,
                    ),
                    PriceLine(
                      title: "Giá giặt mùng chống muỗi (kg - VNĐ)",
                      price: mosquitoNetController_kg,
                    ),
                    PriceLine(
                      title: "Giá giặt đồ com-lê (kg - VNĐ)",
                      price: complexController_kg,
                    ),
                    PriceLine(
                      title: "Giá giặt áo dài Việt Nam (kg - VNĐ)",
                      price: vietnamDressController_kg,
                    ),
                    PriceLine(
                      title: "Giá giặt áo cưới (kg - VNĐ)",
                      price: weedingDressController_kg,
                    ),
                    PriceLine(
                      title: "Giá tẩy trắng (kg - VNĐ)",
                      price: bleachingController_kg,
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
                                          .updateLaundry(
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
                                        clothes: double.tryParse(
                                            clothesController.text)!,
                                        blanket: double.tryParse(
                                            blanketController.text)!,
                                        mosquito: double.tryParse(
                                            mosquitoNetController.text)!,
                                        net: double.tryParse(
                                            netController.text)!,
                                        drap: double.tryParse(
                                            draperyController.text)!,
                                        topper: double.tryParse(
                                            topperController.text)!,
                                        pillow: double.tryParse(
                                            pillowController.text)!,
                                        comple: double.tryParse(
                                            complexController.text)!,
                                        vietnamDress: double.tryParse(
                                            vietnamDressController.text)!,
                                        weedingDress: double.tryParse(
                                            weedingDressController.text)!,
                                        bleaching: double.tryParse(
                                            bleachingController.text)!,
                                        clothes_kg: double.tryParse(
                                            clothesController_kg.text)!,
                                        blanket_kg: double.tryParse(
                                            blanketController_kg.text)!,
                                        mosquito_kg: double.tryParse(
                                            mosquitoNetController_kg.text)!,
                                        net_kg: double.tryParse(
                                            netController_kg.text)!,
                                        drap_kg: double.tryParse( 
                                            draperyController_kg.text)!,
                                        topper_kg: double.tryParse( 
                                            topperController_kg.text)!,
                                        pillow_kg: double.tryParse( 
                                            pillowController_kg.text)!,
                                        comple_kg: double.tryParse( 
                                            complexController_kg.text)!,
                                        vietnamDress_kg: double.tryParse( 
                                            vietnamDressController_kg.text)!,
                                        weedingDress_kg: double.tryParse( 
                                            weedingDressController_kg.text)!,
                                        bleaching_kg: double.tryParse(
                                            bleachingController_kg.text)!,
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
            } else if (state is GetLaundryPriceFailure) {
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

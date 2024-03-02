import 'dart:io';
import 'dart:typed_data';

import 'package:aiohs_web_admin/order_transfer/controllers/transaction.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/button_basic.dart';
import 'package:aiohs_web_admin/utilities/components/filter_line.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney(
      {super.key,
      required this.sender,
      required this.receiver,
      required this.related_order,
      required this.amount});

  final String sender;
  final String receiver;
  final String related_order;
  final double amount;

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  List<String> chooseRecevier = [
    "Chuyển tiền cho giúp việc",
    "Hoàn tiền cho người thuê"
  ];
  int _value = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _amountController = TextEditingController();

  TextEditingController _receiverController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  File? image;
  PlatformFile? platformFile;
  TextEditingController _bankCodeController = TextEditingController();
  TextEditingController _txsCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.amount.toString();
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //     Wrap(
            //         spacing: 5.0,
            //         children: List<Widget>.generate(
            //           3,
            //           (int index) {
            //             return ChoiceChip(
            //               label: Text(statusMaidRes[index].name),
            //               selected: _value == index,
            //               selectedColor: MaterialStateColor.resolveWith(
            //                   (states) =>
            //                       colorProject.primaryColor.withOpacity(0.2)),
            //               onSelected: (bool selected) {
            //                 context.read<MaidRegistrationCubit>().initState();
            //                 context
            //                     .read<MaidRegistrationCubit>()
            //                     .registerMaid(statusMaidRes[index].code);
            //                 setState(() {
            //                   _value = selected ? index : 0;
            //                 });
            //               },
            //             );
            //           },
            //         ).toList(),
            //       ),
            //   ],
            // ),
            FilterLine(
              title: "Số tiền giao dịch (VNĐ)",
              info: _amountController,
              isReadOnly: true,
            ),
            FilterLine(
              title: "Mã người nhận",
              info: _receiverController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập người nhận";
                }
                return null;
              },
            ),
            Responsive.isDesktop(context)
                ? Wrap(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Loại giao dịch: "),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List<Widget>.generate(
                          chooseRecevier.length,
                          (int index) {
                            return ChoiceChip(
                              label: Text(chooseRecevier[index]),
                              selected: _value == index,
                              selectedColor: MaterialStateColor.resolveWith(
                                  (states) => colorProject.primaryColor
                                      .withOpacity(0.2)),
                              onSelected: (bool selected) {
                                setState(() {
                                  _value = selected ? index : 0;
                                });
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Loại giao dịch: "),
                      Wrap(
                        spacing: 5.0,
                        children: List<Widget>.generate(
                          chooseRecevier.length,
                          (int index) {
                            return ChoiceChip(
                              label: Text(chooseRecevier[index]),
                              selected: _value == index,
                              selectedColor: MaterialStateColor.resolveWith(
                                  (states) => colorProject.primaryColor
                                      .withOpacity(0.2)),
                              onSelected: (bool selected) {
                                setState(() {
                                  _value = selected ? index : 0;
                                });
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
            SizedBox(height: 10),
            FilterLine(
                title: "Chi tiết giao dịch",
                info: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập chi tiết giao dịch";
                  }
                  return null;
                }),
            !Responsive.isMobile(context)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hình ảnh giao dịch: "),
                      Row(
                        children: [
                          image == null
                              ? Text("Chưa chọn hình ảnh")
                              : Image.memory(
                                  Uint8List.fromList(platformFile!.bytes!),
                                  width: 100,
                                  height: 100),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePickerWeb.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: [
                                    'jpg',
                                    'jpeg',
                                    'png'
                                  ]);

                              if (result != null) {
                                File file = result.files.single.bytes != null
                                    ? File.fromRawPath(
                                        result.files.single.bytes!)
                                    : File(result.files.single.path!);
                                setState(() {
                                  image = file;
                                  platformFile = result.files.first;
                                });
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: Text("Chọn hình ảnh"),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hình ảnh giao dịch: "),
                      Row(
                        children: [
                          image == null
                              ? Text("Chưa chọn hình ảnh")
                              : Image.memory(
                                  Uint8List.fromList(platformFile!.bytes!),
                                  width: 100,
                                  height: 100),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePickerWeb.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: [
                                    'jpg',
                                    'jpeg',
                                    'png'
                                  ]);

                              if (result != null) {
                                File file = result.files.single.bytes != null
                                    ? File.fromRawPath(
                                        result.files.single.bytes!)
                                    : File(result.files.single.path!);
                                setState(() {
                                  image = file;
                                  platformFile = result.files.first;
                                });
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: Text("Chọn hình ảnh"),
                          ),
                        ],
                      ),
                    ],
                  ),
            SizedBox(height: 10),
            FilterLine(
                title: "Mã ngân hàng",
                info: _bankCodeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập mã ngân hàng";
                  }
                  return null;
                }),
            SizedBox(height: 10),
            FilterLine(
              title: "Mã giao dịch chuyển khoản",
              info: _txsCodeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập mã giao dịch chuyển khoản";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ButtonBasic(
                text: "Xác nhận",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (image == null) {
                      showDialogWarning(
                        context: context,
                        message: "Vui lòng chọn hình ảnh giao dịch",
                        btnOkOnPress: () {},
                      );
                    } else {
                      showDialogWarning(
                        context: context,
                        message:
                            "Bạn có chắc chắn xác nhận giao dịch chuyển tiền?",
                        btnOkOnPress: () async {
                          showCircleProgress(context);
                          try {
                            // await MaidRegistrationController().approveMaidRegistration(maidRegistration.user_code.toString());
                            // Navigator.pop(context);
                            await TransactionController().transferMoney(
                              receiver: _receiverController.text,
                              amount: widget.amount.toDouble(),
                              description: chooseRecevier[_value] +
                                  ": " +
                                  _descriptionController.text,
                              image: image!,
                              platformFile: platformFile!,
                              related_order: widget.related_order,
                              bank_code: _bankCodeController.text,
                              txs_code: _txsCodeController.text,
                            );
                            Navigator.pop(context);
                            showDialogSuccess(context,
                                "Xác nhận giao dich chuyển tiền thành công!",
                                canPop: true);
                            // await maidRegistrationCubit.initState();
                            // await maidRegistrationCubit.registerMaid("MAID_REGISTRATION_STATUS_CREATED");
                          } catch (e) {
                            Navigator.pop(context);
                            showDialogError(context, e.toString(),
                                canPop: true);
                          }
                        },
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

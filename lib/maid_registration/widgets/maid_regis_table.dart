// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/maid_registration/controllers/maid.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_cubit.dart';
import 'package:aiohs_web_admin/maid_registration/widgets/id_card.dart';
import 'package:aiohs_web_admin/maid_registration/widgets/update_request.dart';
import 'package:aiohs_web_admin/utilities/constants/function.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaidRegistrationTable extends StatefulWidget {
  const MaidRegistrationTable({super.key});

  @override
  State<MaidRegistrationTable> createState() => _MaidRegistrationTableState();
}

class _MaidRegistrationTableState extends State<MaidRegistrationTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var maidRegistrationCubit = context.watch<MaidRegistrationCubit>();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 1000,
        dataRowHeight: 100,
        empty: Text("Không có dữ liệu"),
        headingTextStyle: TextStyle(
          fontFamily: fontFamilyBold,
          color: isDark ? Colors.white : Colors.black,
        ),
        columns: [
          DataColumn(
              label: Text('Mã người dùng', overflow: TextOverflow.ellipsis)),
          DataColumn(label: Text('Tên đầy đủ')),
          DataColumn(label: Text('Số CMND/CCCD')),
          DataColumn(label: Text('Nơi sinh')),
          DataColumn(label: Text('Ngày sinh')),
          DataColumn(label: Text('Địa chỉ liên lạc')),
          DataColumn(label: Text('Trạng thái')),
          DataColumn(label: Text('Ảnh trước/sau của CMND/CCCD')),
          DataColumn(label: Text('Thao tác')),
        ],
        rows: [
          for (var maidRegistration in maidRegistrationCubit.maidRegistrations)
            DataRow(
              cells: [
                DataCell(Text(maidRegistration.user_code.toString())),
                DataCell(Text(maidRegistration.full_name)),
                DataCell(Text(maidRegistration.identity_no)),
                DataCell(Text(maidRegistration.permanent_address)),
                DataCell(Text(maidRegistration.date_of_birth)),
                DataCell(Text(maidRegistration.contact_address)),
                DataCell(Text(maidRegistration.registration_status_display)),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ảnh trước/sau của CMND/CCCD',
                                  style: TextStyle(
                                      fontFamily: fontFamilyBold,
                                      fontSize: fontSize.mediumLarger)),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                          content: IDCard(
                            identity_front_image_url:
                                maidRegistration.identity_front_image_url,
                            identity_back_image_url:
                                maidRegistration.identity_back_image_url,
                          ),
                        ),
                      );
                    },
                    child: Text('Xem chi tiết'),
                  ),
                ),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialogWarning(
                            context: context,
                            message:
                                "Bạn có chắc chắn muốn duyệt đơn giúp việc cho người dùng ${maidRegistration.user_code}?",
                            btnOkOnPress: () async {
                              showCircleProgress(context);
                              try {
                                await MaidRegistrationController()
                                    .approveMaidRegistration(
                                        maidRegistration.user_code.toString());
                                Navigator.pop(context);
                                showDialogSuccess(context,
                                    "Duyệt đơn giúp việc thành công cho người dùng ${maidRegistration.user_code}");
                                await maidRegistrationCubit.initState();
                                await maidRegistrationCubit.registerMaid(
                                    "MAID_REGISTRATION_STATUS_CREATED");
                              } catch (e) {
                                Navigator.pop(context);
                                showDialogError(context, e.toString());
                              }
                            },
                          );
                        },
                        tooltip: "Duyệt đơn",
                        icon: Icon(Icons.check),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lý do từ chối người dùng ${maidRegistration.user_code}',
                                    style: TextStyle(
                                      fontFamily: fontFamilyBold,
                                      fontSize: fontSize.mediumLarger,
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
                              content: UpdateMaidRequest(
                                id: maidRegistration.user_code.toString(),
                              ),
                            ),
                          );
                        },
                        tooltip: "Từ chối đơn",
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                )
              ],
            ),
        ],
      ),
    );

    // if (maidRegistrationCubit.maidRegistrations.length == 0)
    //   SelectableText("Không có dữ liệu"),
    // if (maidRegistrationCubit.state is MaidRegistrationLoading)
    //   CircularProgressIndicator(
    //     color: colorProject.primaryColor,
    //   )
    // else
    //   ElevatedButton(
    //     onPressed: () {
    //       maidRegistrationCubit.maidRegistrations;
    //     },
    //     child: Text("Tải thêm dữ liệu"),
    //   )
  }
}

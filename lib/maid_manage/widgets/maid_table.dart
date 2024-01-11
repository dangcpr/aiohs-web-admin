// ignore_for_file: use_build_context_synchronously

import 'package:aiohs_web_admin/maid_manage/cubits/get_reviews/get_reviews_cubit.dart';
import 'package:aiohs_web_admin/maid_manage/widgets/remove_maid.dart';
import 'package:aiohs_web_admin/maid_manage/widgets/review_dialog.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_cubit.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_state.dart';
import 'package:aiohs_web_admin/maid_registration/widgets/id_card.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaidTable extends StatefulWidget {
  const MaidTable({super.key});

  @override
  State<MaidTable> createState() => _MaidTableState();
}

class _MaidTableState extends State<MaidTable> {
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
        empty: maidRegistrationCubit.state is MaidRegistrationLoading
            ? SelectableText("Đang tải ...")
            : (maidRegistrationCubit.state is MaidRegistrationFailure
                ? SelectableText("Có lỗi xảy ra")
                : SelectableText("Không có dữ liệu")),
        headingTextStyle: TextStyle(
          fontFamily: fontFamilyBold,
          color: isDark ? Colors.white : Colors.black,
        ),
        columns: [
          DataColumn2(
              label: Text('Mã người dùng', softWrap: true), fixedWidth: 90),
          DataColumn(label: Text('Tên đầy đủ', softWrap: true)),
          DataColumn(label: Text('Số CMND/CCCD', softWrap: true)),
          DataColumn(label: Text('Địa chỉ liên lạc', softWrap: true)),
          DataColumn(
              label: Text('Ảnh trước/sau của CMND/CCCD', softWrap: true)),
          DataColumn(label: Text('Thao tác', softWrap: true)),
        ],
        rows: [
          for (var maidRegistration in maidRegistrationCubit.maidRegistrations)
            DataRow(
              cells: [
                DataCell(Text(maidRegistration.user_code.toString())),
                DataCell(Text(maidRegistration.full_name)),
                DataCell(Text(maidRegistration.identity_no)),
                DataCell(Text(maidRegistration.contact_address)),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ảnh trước/sau của CMND/CCCD',
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
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Thông tin người giúp việc ${maidRegistration.user_code}',
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
                                  content: BlocProvider<GetReviewsCubit>(
                                    create: (context) => GetReviewsCubit(),
                                    child: ReviewMaidDialog(
                                        maidId: maidRegistration.user_code
                                            .toString()),
                                  ),
                                );
                              });
                        },
                        tooltip: "Xem nhận xét về giúp việc",
                        icon: Icon(Icons.reviews),
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
                                    'Lý do gỡ vai trò giúp việc của người dùng ${maidRegistration.user_code}',
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
                              content: RemoveMaid(
                                maidID: maidRegistration.user_code.toString(),
                              ),
                            ),
                          );
                        },
                        tooltip: "Gỡ vai trò giúp việc",
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

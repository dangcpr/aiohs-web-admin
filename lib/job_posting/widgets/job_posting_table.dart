import 'package:aiohs_web_admin/job_posting/cubits/get_job_posting/job_posting_cubit.dart';
import 'package:aiohs_web_admin/job_posting/cubits/get_job_posting/job_posting_state.dart';
import 'package:aiohs_web_admin/job_posting/widgets/cancel_job.dart';
import 'package:aiohs_web_admin/job_posting/widgets/detail_images_jobs.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobPostingTable extends StatefulWidget {
  const JobPostingTable({super.key});

  @override
  State<JobPostingTable> createState() => _JobPostingTableState();
}

class _JobPostingTableState extends State<JobPostingTable> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var getJobPosting = context.watch<GetJobPostingCubit>();
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 1000,
        dataRowHeight: 100,
        headingRowHeight: 80,
        empty: getJobPosting.state is GetJobPostingError
            ? Text((getJobPosting.state as GetJobPostingError).message)
            : (getJobPosting.state is GetJobPostingLoading
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
              fixedWidth: 120),
          DataColumn2(
              label: Text('Trạng thái bài đăng', softWrap: true),
              fixedWidth: 120),
          DataColumn2(
              label: Text('Chi tiết + Hình ảnh chỗ làm việc', softWrap: true),
              fixedWidth: 150),
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
          for (var jobs in getJobPosting.jobPosting)
            DataRow(
              cells: [
                DataCell(Text(jobs.code == '' ? '(trống)' : jobs.code)),
                DataCell(
                    Text(jobs.user_code == '' ? '(trống)' : jobs.user_code)),
                DataCell(Text(jobs.status_display == ''
                    ? '(trống)'
                    : jobs.status_display)),
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
                                  "Chi tiết + Hình ảnh chỗ làm việc",
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
                          content: DetailImagesJobs(jobPosting: jobs),
                        ),
                      );
                    },
                    child: Text('Xem chi tiết'),
                  ),
                ),
                DataCell(Text(jobs.working_address == ''
                    ? '(trống)'
                    : jobs.working_address)),
                DataCell(
                    Text(jobs.created_at == '' ? '(trống)' : jobs.created_at)),
                DataCell(
                    Text(jobs.updated_at == '' ? '(trống)' : jobs.updated_at)),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        tooltip: 'Hủy bài cho thuê giúp việc',
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              scrollable: true,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              content: CancelJob(jobPosting: jobs),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

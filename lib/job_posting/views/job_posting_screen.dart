import 'package:aiohs_web_admin/job_posting/cubits/get_job_posting/job_posting_cubit.dart';
import 'package:aiohs_web_admin/job_posting/cubits/get_job_posting/job_posting_state.dart';
import 'package:aiohs_web_admin/job_posting/widgets/filter_job.dart';
import 'package:aiohs_web_admin/job_posting/widgets/job_posting_table.dart';
import 'package:aiohs_web_admin/main_screen/widgets/side_bar.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../responsive/controllers/size.dart';

class JobPostingScreen extends StatefulWidget {
  const JobPostingScreen({super.key});

  @override
  State<JobPostingScreen> createState() => _JobPostingScreenState();
}

class _JobPostingScreenState extends State<JobPostingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetJobPostingCubit>().initState();
    context.read<GetJobPostingCubit>().getJobPosting();
  }
  @override
  Widget build(BuildContext context) {
    var getJobPostingCubit = context.watch<GetJobPostingCubit>();
    return Title(
      title: "Tin tuyển giúp việc",
      color: Colors.white,
      child: Scaffold(
        drawer: Responsive.isMobile(context) ? SideBar() : null,
        appBar: AppBar(
          title: SelectableText(
            "Tin tuyển giúp việc",
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
                    content: FilterJobs(),
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
            Expanded(child: JobPostingTable()),
            if (getJobPostingCubit.state is GetJobPostingLoading)
              CircularProgressIndicator(
                color: colorProject.primaryColor,
              ),
            if (getJobPostingCubit.next != "0")
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorProject.primaryColor,
                ),
                onPressed: () {
                  getJobPostingCubit.getJobPosting();
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

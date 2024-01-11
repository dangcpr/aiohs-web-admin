import 'package:aiohs_web_admin/job_posting/models/job_posting.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailImagesJobs extends StatelessWidget {
  const DetailImagesJobs({super.key, required this.jobPosting});

  final JobPosting jobPosting;

  @override
  Widget build(BuildContext context) {
    TextStyle normal =
        TextStyle(fontSize: fontSize.medium, fontFamily: fontFamily);
    TextStyle bold =
        TextStyle(fontSize: fontSize.medium, fontFamily: fontFamilyBold);
    return Container(
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width / 1.2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width / 1.7
              : MediaQuery.of(context).size.width / 2.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Tiêu đề bài viết: ',
                  style: bold,
                ),
                TextSpan(
                  text: jobPosting.title,
                  style: normal,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Mô tả: ',
                  style: bold,
                ),
                TextSpan(
                  text: jobPosting.description,
                  style: normal,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Hình ảnh chỗ làm: ',
                  style: bold,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Yêu cầu giới tính: ',
                  style: bold,
                ),
                TextSpan(
                  text: jobPosting.candidate_gender.toString(),
                  style: normal,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Số lượng tuyển: ',
                  style: bold,
                ),
                TextSpan(
                  text: jobPosting.number_employee.toString(),
                  style: normal,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Độ tuổi: ',
                  style: bold,
                ),
                TextSpan(
                  text:
                      '${jobPosting.candidate_min_age} - ${jobPosting.candidate_max_age}',
                  style: normal,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Hình thức trả lương: ',
                  style: bold,
                ),
                TextSpan(
                  text: jobPosting.wage_type_display.toString(),
                  style: normal,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Mức lương: ',
                  style: bold,
                ),
                TextSpan(
                  text:
                      '${NumberFormat.currency(locale: 'vi', decimalDigits: 0).format(jobPosting.wage_min)} - ${NumberFormat.currency(locale: 'vi', decimalDigits: 0).format(jobPosting.wage_max)}',
                  style: normal,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          for (var image in jobPosting.images)
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
        ],
      ),
    );
  }
}

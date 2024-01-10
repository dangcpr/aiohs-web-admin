import 'package:aiohs_web_admin/area_booking/models/area_booking.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailAndImageArea extends StatelessWidget {
  const DetailAndImageArea({super.key, required this.areaBooking});

  final AreaBooking areaBooking;

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
                  text: areaBooking.title,
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
                  text: 'Số ngày cho thuê: ',
                  style: bold,
                ),
                TextSpan(
                  text: areaBooking.number_rental_days.toString(),
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
                  text: 'Diện tích cho thuê: ',
                  style: bold,
                ),
                TextSpan(
                  text: areaBooking.number_rental_days.toString(),
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
                  text: 'Giá thuê: ',
                  style: bold,
                ),
                TextSpan(
                  text: NumberFormat.currency(locale: "vi_VN")
                      .format(areaBooking.price)
                      .toString(),
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
                  text: areaBooking.description,
                  style: normal,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          for (var image in areaBooking.images)
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

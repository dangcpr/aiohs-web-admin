import 'package:aiohs_web_admin/maid_manage/models/rating.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key, required this.rating});

  final RatingMaid rating;

  @override
  Widget build(BuildContext context) {
    TextStyle normal =
        TextStyle(fontSize: fontSize.medium, fontFamily: fontFamily);
    TextStyle bold = TextStyle(
        fontSize: fontSize.medium,
        fontFamily: fontFamilyBold,
        color: Colors.black);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorProject.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 100,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    rating.star.toString(),
                    style: TextStyle(
                      fontSize: fontSize.mediumLarger + 2,
                      fontFamily: fontFamilyBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  rating.renter_name,
                  style: TextStyle(
                    fontSize: fontSize.medium,
                    fontFamily: fontFamilyBold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Dịch vụ: ',
                        style: bold,
                      ),
                      TextSpan(
                        text: rating.product_name,
                        style: normal,
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Nhận xét về giúp việc: ',
                        style: bold,
                      ),
                      TextSpan(
                        text: rating.comment,
                        style: normal,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

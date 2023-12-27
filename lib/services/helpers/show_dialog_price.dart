import 'package:aiohs_web_admin/services/widgets/every_product/cleaning_hourly/cleaning_hourly_page.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';

void showDialogPrice(String productCode, String name, String title, String icon_url, BuildContext context) {
  switch (productCode) {
    case "CLEAN_ON_DEMAND":
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Giúp việc theo ca lẻ",
                    style: TextStyle(fontFamily: fontFamilyBold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ),
            content: CleaningHourlyPricePage(
              name: name,
              title: title,
              icon_url: icon_url,
            ),
          );
        },
      );
      break;
  }
}

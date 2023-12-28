import 'package:aiohs_web_admin/services/widgets/every_product/air_cond_clean/air_cond_clean_page.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/cleaning_hourly/cleaning_hourly_page.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/cleaning_sub/cleaning_sub_page.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/cooking/cooking_page.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/laundry/laundry_page.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/shopping/shopping_page.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:flutter/material.dart';

void showDialogPrice(String productCode, String name, String title,
    String icon_url, BuildContext context) {
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
    case 'CLEAN_SUBSCRIPTION':
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
                    "Giúp việc dài hạn",
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
            content: CleaningSubPricePage(
              name: name,
              title: title,
              icon_url: icon_url,
            ),
          );
        },
      );
      break;
    case 'GROCERY_ASSISTANT':
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
                    "Đi chợ hộ",
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
            content: ShoppingPricePage(
              name: name,
              title: title,
              icon_url: icon_url,
            ),
          );
        },
      );
      break;
    case 'HOME_COOKING':
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
                    "Nấu ăn gia đình",
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
            content: CookingPricePage(
              name: name,
              title: title,
              icon_url: icon_url,
            ),
          );
        },
      );
      break;
    case 'LAUNDRY':
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
                    "Giặt ủi",
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
            content: LaundryPricePage(
              name: name,
              title: title,
              icon_url: icon_url,
            ),
          );
        },
      );
      break;

    case 'AIR_CONDITIONING_CLEAN':
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
                    "Sửa máy lạnh",
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
            content: AirCondPricePage(
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

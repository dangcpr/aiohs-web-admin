import 'dart:io';

import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

String handleError(DioException e) {
  debugPrint(e.type.toString());
  if (e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionTimeout) {
    return 'Connection Timeout';
  }

  if (e.type == DioExceptionType.unknown ||
      e.type == DioExceptionType.connectionError) {
    return 'Internet Error or Server Error';
  }
  debugPrint(e.type.toString());
  return 'Server Error';
}

void showCircleProgress(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => PopScope(
      canPop: false,
      child: Center(
        child: CircularProgressIndicator(
          color: colorProject.primaryColor,
        ),
      ),
    ),
  );
}

void showDialogSuccess(BuildContext context, String message,
    {bool canPop = false}) {
  AwesomeDialog(
    width: Responsive.isMobile(context)
        ? MediaQuery.of(context).size.width / 1
        : Responsive.isTablet(context)
            ? MediaQuery.of(context).size.width / 2
            : MediaQuery.of(context).size.width / 3.5,
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.bottomSlide,
    title: 'Thao tác thành công',
    desc: message,
    btnOkOnPress: () {
      if (canPop) {
        Navigator.pop(context);
      }
    },
  ).show();
}

void showDialogError(BuildContext context, String message,
    {bool canPop = false}) {
  AwesomeDialog(
    width: Responsive.isMobile(context)
        ? MediaQuery.of(context).size.width / 1
        : Responsive.isTablet(context)
            ? MediaQuery.of(context).size.width / 2
            : MediaQuery.of(context).size.width / 3.5,
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.bottomSlide,
    title: 'Có lỗi xảy ra',
    desc: message,
    btnOkOnPress: () {
      if (canPop) {
        Navigator.pop(context);
      }
    },
  ).show();
}

void showDialogWarning({
  required BuildContext context,
  required String message,
  required Function() btnOkOnPress,
}) {
  AwesomeDialog(
    width: Responsive.isMobile(context)
        ? MediaQuery.of(context).size.width / 1
        : Responsive.isTablet(context)
            ? MediaQuery.of(context).size.width / 2
            : MediaQuery.of(context).size.width / 3.5,
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.bottomSlide,
    title: 'Cảnh báo',
    desc: message,
    btnOkOnPress: btnOkOnPress,
    btnCancelOnPress: () {},
  ).show();
}


Future<String> uploadImage(File file, PlatformFile platformFile) async {
  try {
    final response = await cloudinary.upload(
      // file: file.path,
      fileBytes: platformFile.bytes!,
      resourceType: CloudinaryResourceType.image,
      folder: "/images",
      progressCallback: (count, total) {
        print('Uploading image from file with progress: $count/$total');
      },
    );

    if (response.isSuccessful) {
      return response.url!;
    } else {
      throw response.error!;
    }
  } catch (e) {
    debugPrint(e.toString());
    throw e.toString();
  }
}
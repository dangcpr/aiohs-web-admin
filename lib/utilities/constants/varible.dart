import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const fontFamily = 'Poppins-Regular';
const fontFamilyBold = 'Poppins-ExtraBold';
const logoFull = 'assets/images/logo_full.png';
const server = 'https://api.aiohs.site';
// const debugServer = 'http://192.168.206.129:9000';
const from_date_default = '2023-10-10';
final dio = Dio(
  BaseOptions(
    baseUrl: server,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    validateStatus: (status) {
      return status! < 500;
    },
  ),
);

class colorProject {
  static const Color primaryColor = Color(0xFF00B27D);
  static const Color subColor = Color(0xFF696969);
  static const Color smallTitle = Colors.black;
  static const Color primaryColorLight = Color.fromARGB(255, 0, 223, 156);
  static const Color primaryColorLightest = Color.fromARGB(255, 143, 255, 221);
  static const Color secondaryColorLight = Color.fromARGB(255, 78, 252, 255);
}

class fontSize {
  static const double large = 24;
  static const double mediumLarger = 17;
  static const double medium = 15;
  static const double textField = 13;
}

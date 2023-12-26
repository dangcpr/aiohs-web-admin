import 'package:aiohs_web_admin/router/controller.dart';
import 'package:aiohs_web_admin/theme/dark_theme.dart';
import 'package:aiohs_web_admin/theme/light_theme.dart';
import 'package:aiohs_web_admin/utilities/constants/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MultiBlocProvider(providers: listProvider, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AIO Home Services - Admin',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}

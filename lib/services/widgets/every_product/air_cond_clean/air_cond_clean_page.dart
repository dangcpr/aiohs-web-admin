import 'package:aiohs_web_admin/services/cubits/every_service/air_cond_clean/air_cond_price_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/air_cond_clean/air_cond_clean_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirCondPricePage extends StatefulWidget {
  const AirCondPricePage({super.key, required this.name, required this.title, required this.icon_url});

  final String name;
  final String title;
  final String icon_url;


  @override
  State<AirCondPricePage> createState() =>
      _AirCondPricePagePricePageState();
}

class _AirCondPricePagePricePageState extends State<AirCondPricePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAirCondCleanPriceCubit(),
      child: AirCondPriceScreen(
        name: widget.name,
        title: widget.title,
        icon_url: widget.icon_url,
      ),
    );
  }
}

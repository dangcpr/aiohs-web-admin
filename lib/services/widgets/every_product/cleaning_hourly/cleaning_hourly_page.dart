import 'package:aiohs_web_admin/services/cubits/every_service/cleaning_hourly/cleaning_hourly_price_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/cleaning_hourly/cleaning_hourly_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CleaningHourlyPricePage extends StatefulWidget {
  const CleaningHourlyPricePage({super.key, required this.name, required this.title, required this.icon_url});

  final String name;
  final String title;
  final String icon_url;


  @override
  State<CleaningHourlyPricePage> createState() =>
      _CleaningHourlyPricePageState();
}

class _CleaningHourlyPricePageState extends State<CleaningHourlyPricePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCleaningHourlyPriceCubit(),
      child: CleaningHourlyPriceScreen(
        name: widget.name,
        title: widget.title,
        icon_url: widget.icon_url,
      ),
    );
  }
}

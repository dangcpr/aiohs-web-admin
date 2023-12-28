import 'package:aiohs_web_admin/services/cubits/every_service/laundry/laundry_price_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/laundry/laundry_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryPricePage extends StatefulWidget {
  const LaundryPricePage({super.key, required this.name, required this.title, required this.icon_url});

  final String name;
  final String title;
  final String icon_url;


  @override
  State<LaundryPricePage> createState() =>
      _LaundryPricePageState();
}

class _LaundryPricePageState extends State<LaundryPricePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetLaundryPriceCubit(),
      child: LaundryPriceScreen(
        name: widget.name,
        title: widget.title,
        icon_url: widget.icon_url,
      ),
    );
  }
}

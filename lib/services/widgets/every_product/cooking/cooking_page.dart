import 'package:aiohs_web_admin/services/cubits/every_service/cooking/cooking_price_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/cooking/cooking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CookingPricePage extends StatefulWidget {
  const CookingPricePage({super.key, required this.name, required this.title, required this.icon_url});

  final String name;
  final String title;
  final String icon_url;


  @override
  State<CookingPricePage> createState() =>
      _CookingPricePageState();
}

class _CookingPricePageState extends State<CookingPricePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCookingPriceCubit(),
      child: CookingPriceScreen(
        name: widget.name,
        title: widget.title,
        icon_url: widget.icon_url,
      ),
    );
  }
}

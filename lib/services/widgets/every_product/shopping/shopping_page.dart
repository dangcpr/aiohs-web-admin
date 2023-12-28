import 'package:aiohs_web_admin/services/cubits/every_service/shopping/shopping_price_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/shopping/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingPricePage extends StatefulWidget {
  const ShoppingPricePage({super.key, required this.name, required this.title, required this.icon_url});

  final String name;
  final String title;
  final String icon_url;


  @override
  State<ShoppingPricePage> createState() =>
      _ShoppingPricePageState();
}

class _ShoppingPricePageState extends State<ShoppingPricePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetShoppingPriceCubit(),
      child: ShoppingPriceScreen(
        name: widget.name,
        title: widget.title,
        icon_url: widget.icon_url,
      ),
    );
  }
}

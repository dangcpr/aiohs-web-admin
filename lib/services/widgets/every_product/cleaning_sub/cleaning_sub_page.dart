import 'package:aiohs_web_admin/services/cubits/every_service/cleaning_sub/cleaning_sub_price_cubit.dart';
import 'package:aiohs_web_admin/services/widgets/every_product/cleaning_sub/cleaning_sub_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CleaningSubPricePage extends StatefulWidget {
  const CleaningSubPricePage({super.key, required this.name, required this.title, required this.icon_url});

  final String name;
  final String title;
  final String icon_url;


  @override
  State<CleaningSubPricePage> createState() =>
      _CleaningSubPricePagePageState();
}

class _CleaningSubPricePagePageState extends State<CleaningSubPricePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCleaningSubPriceCubit(),
      child: CleaningSubPriceScreen(
        name: widget.name,
        title: widget.title,
        icon_url: widget.icon_url,
      ),
    );
  }
}

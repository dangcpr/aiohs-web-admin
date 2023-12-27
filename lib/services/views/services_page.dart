import 'package:aiohs_web_admin/services/cubits/get_service/get_service_cubit.dart';
import 'package:aiohs_web_admin/services/views/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetServiceCubit(),
      child: ServicesScreen(),
    );
  }
}

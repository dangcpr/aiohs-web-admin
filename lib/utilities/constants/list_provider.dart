import 'package:aiohs_web_admin/login/cubits/user_cubit.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_cubit.dart';
import 'package:aiohs_web_admin/main_screen/cubits/page_number.dart';
import 'package:aiohs_web_admin/services/cubits/get_service/get_service_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var listProvider = [
  BlocProvider<UserCubit>(
    create: (_) => UserCubit(),
  ),
  BlocProvider<SideBarController>(
    create: (_) => SideBarController(),
  ),
  BlocProvider<GetServiceCubit>(
    create: (_) => GetServiceCubit(),
  ),
  BlocProvider<MaidRegistrationCubit>(
    create: (_) => MaidRegistrationCubit(),
  )
];

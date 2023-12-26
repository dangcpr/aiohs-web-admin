import 'package:aiohs_web_admin/login/cubits/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final listProvider = [
  BlocProvider(
    create: (context) => UserCubit(),
  )
];

import 'package:aiohs_web_admin/area_booking/cubits/get_area_booking/get_area_booking_cubit.dart';
import 'package:aiohs_web_admin/dashboard/cubits/get_report/get_report_cubit.dart';
import 'package:aiohs_web_admin/holiday/cubits/get_holiday/get_holiday_cubit.dart';
import 'package:aiohs_web_admin/job_posting/cubits/get_job_posting/job_posting_cubit.dart';
import 'package:aiohs_web_admin/login/cubits/user_cubit.dart';
import 'package:aiohs_web_admin/maid_registration/cubits/maid_registration/maid_registration_cubit.dart';
import 'package:aiohs_web_admin/main_screen/cubits/page_number.dart';
import 'package:aiohs_web_admin/services/cubits/get_service/get_service_cubit.dart';
import 'package:aiohs_web_admin/user_manage/cubits/get_user/get_user_cubit.dart';
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
  ),
  BlocProvider<GetListUserCubit>(
    create: (_) => GetListUserCubit(),
  ),
  BlocProvider<GetHolidaysCubit>(
    create: (_) => GetHolidaysCubit(),
  ),
  BlocProvider<GetAreaBookingCubit>(
    create: (_) => GetAreaBookingCubit(),
  ),
  BlocProvider<GetJobPostingCubit>(
    create: (_) => GetJobPostingCubit(),
  ),
  BlocProvider<GetReportCubit>(
    create: (_) => GetReportCubit(),
  )
];

import 'package:aiohs_web_admin/area_booking/views/area_booking_page.dart';
import 'package:aiohs_web_admin/dashboard/views/dashboard_page.dart';
import 'package:aiohs_web_admin/holiday/views/holiday_page.dart';
import 'package:aiohs_web_admin/job_posting/views/job_posting_page.dart';
import 'package:aiohs_web_admin/maid_manage/views/maid_manage_page.dart';
import 'package:aiohs_web_admin/maid_registration/views/maid_registration_page.dart';
import 'package:aiohs_web_admin/order_transfer/views/order_transfer_page.dart';
import 'package:aiohs_web_admin/services/views/services_page.dart';
import 'package:aiohs_web_admin/user_manage/views/user_manage_page.dart';

var listPage = [
  DashboardPage(),
  UserManagePage(),
  ServicesPage(),
  HolidayPage(),
  MaidRegistrationPage(),
  MaidManagePage(),
  AreaBookingPage(),
  JobPostingPage(),
  OrderTransferPage(),
];

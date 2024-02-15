import 'package:aiohs_web_admin/login/views/login_page.dart';
import 'package:aiohs_web_admin/main_screen/cubits/page_number.dart';
import 'package:aiohs_web_admin/main_screen/views/main_screen.dart';
import 'package:aiohs_web_admin/utilities/global/varible.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) {
        if (isLogin == false)
          return '/login';
        else
          return '/main';
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/main/:path',
      pageBuilder: (context, state) {
        if (state.pathParameters['path'] == 'dashboard')
          context.read<SideBarController>().updateIndex(0);
        else if (state.pathParameters['path'] == 'user-manage')
          context.read<SideBarController>().updateIndex(1);
        else if (state.pathParameters['path'] == 'service')
          context.read<SideBarController>().updateIndex(2);
        else if (state.pathParameters['path'] == 'holiday')
          context.read<SideBarController>().updateIndex(3);
        else if (state.pathParameters['path'] == 'maid-registration')
          context.read<SideBarController>().updateIndex(4);
        else if (state.pathParameters['path'] == 'maid-manage')
          context.read<SideBarController>().updateIndex(5);
        else if (state.pathParameters['path'] == 'area-booking')
          context.read<SideBarController>().updateIndex(6);
        else if (state.pathParameters['path'] == 'job-posting')
          context.read<SideBarController>().updateIndex(7);
        else if (state.pathParameters['path'] == 'order-transfer')
          context.read<SideBarController>().updateIndex(8);

        return NoTransitionPage<void>(
          key: state.pageKey,
          child: MainScreen(),
        );
      },
      redirect: (context, state) {
        if (isLogin == false) {
          return '/login';
        } else {
          return null;
        }
      },
    ),
    GoRoute(
      path: '/main',
      redirect: (context, state) {
        if (isLogin == false)
          return '/login';
        else {
          return '/main/user-manage';
        }
      },
    ),
  ],
);

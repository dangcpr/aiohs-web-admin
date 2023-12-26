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
        else if (state.pathParameters['path'] == 'service')
          context.read<SideBarController>().updateIndex(1);

        return NoTransitionPage<void>(
          key: state.pageKey,
          child: MainScreen(),
        );
      },
    ),
    GoRoute(
      path: '/main',
      redirect: (context, state) {
        if (isLogin == false)
          return '/login';
        else {
          return '/main/dashboard';
        }
      },
    ),
  ],
);

import 'package:aiohs_web_admin/login/views/login_screen.dart';
import 'package:aiohs_web_admin/main_screen/views/main_screen.dart';
import 'package:aiohs_web_admin/utilities/global/varible.dart';
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
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/main',
      redirect: (context, state) {
        if (isLogin == false)
          return '/login';
        else
          return '/main';
      },
      builder: (context, state) => const MainScreen(),
    )
  ],
);
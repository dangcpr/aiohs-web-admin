import 'package:aiohs_web_admin/login/cubits/login/login_cubit.dart';
import 'package:aiohs_web_admin/login/cubits/login/login_state.dart';
import 'package:aiohs_web_admin/login/widgets/login_widget.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<LoginCubit>(),
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pop(context);
          context.go('/main');
          return;
        }
        if (state is LoginFailed) {
          Navigator.pop(context);
          AwesomeDialog(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width / 1
                : Responsive.isTablet(context)
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width / 3.5,
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Đăng nhập thất bại',
            desc: state.error,
            dismissOnTouchOutside: false,
            btnOkOnPress: () {},
          ).show();
        }
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const Center(
                child:
                    CircularProgressIndicator(color: colorProject.primaryColor),
              );
            },
          );
        }
      },
      child: Title(
        title: "Đăng nhập",
        color: Colors.black,
        child: Scaffold(
          body: Center(child: LoginWidget()),
        ),
      ),
    );
  }
}

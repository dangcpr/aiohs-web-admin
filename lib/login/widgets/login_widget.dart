import 'package:aiohs_web_admin/login/controllers/login.dart';
import 'package:aiohs_web_admin/responsive/controllers/size.dart';
import 'package:aiohs_web_admin/utilities/components/text_field.dart';
import 'package:aiohs_web_admin/utilities/constants/varible.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Container(
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width / 1.2
          : Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width / 1.8
              : MediaQuery.of(context).size.width / 2.2,
      height: MediaQuery.of(context).size.height / 1.5,
      decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: const Offset(0, 3),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                logoFull,
                fit: BoxFit.scaleDown,
                height: 70,
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 85,
                child: TextFieldBasic(
                  label: 'Email',
                  icon: const Icon(Icons.email),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng điền email';
                    }
                    if (EmailValidator.validate(value) == false) {
                      return 'Email không đúng định dạng';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 85,
                child: TextFieldBasic(
                  controller: passwordController,
                  label: 'Password',
                  obscureText: true,
                  icon: const Icon(Icons.lock),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorProject.primaryColor,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await LoginController().login();
                      print('Login success!');
                      context.go('/main');
                    } else {
                      print('Login failed!');
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontSize: fontSize.mediumLarger),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

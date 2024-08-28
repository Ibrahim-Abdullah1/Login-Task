import 'package:bloc_login/components/error_message_widget.dart';
import 'package:bloc_login/view/login/widgets/email_input.dart';
import 'package:bloc_login/view/login/widgets/login_button.dart';
import 'package:bloc_login/view/login/widgets/password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );

    return Scaffold(
      body: Container(
        height: 812.h,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Login_bg.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Log In!",
                  style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffCD5B97)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const EmailInput(),
                SizedBox(height: 16.h),
                const PasswordInput(),
                SizedBox(height: 24.h),
                const LoginButton(),
                SizedBox(height: 16.h),
                const ErrorMessage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

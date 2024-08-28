import 'package:bloc_login/bloc/login_bloc/login_cubits/login_cubit.dart';
import 'package:bloc_login/bloc/login_bloc/login_states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.isSubmitting
            ? const CircularProgressIndicator()
            : Center(
              child: SizedBox(
                  width: 150.w,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginCubit>().logInWithCredentials();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 17.sp,color: Colors.black,fontWeight: FontWeight.bold)),
                  ),
                ),
            );
      },
    );
  }
}
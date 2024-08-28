import 'package:bloc_login/bloc/login_bloc/login_cubits/login_cubit.dart';
import 'package:bloc_login/bloc/login_bloc/login_states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage!,
                style: TextStyle(fontSize: 14.sp),
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(16.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              duration: const Duration(seconds: 3),
            ),
          );
        }

        if (state.successMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.successMessage!,
                style: TextStyle(fontSize: 14.sp),
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(16.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child:
          Container(), // Dummy container to satisfy the BlocListener requirement
    );
  }
}

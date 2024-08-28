import 'package:bloc_login/bloc/login_bloc/login_cubits/login_cubit.dart';
import 'package:bloc_login/bloc/login_bloc/login_states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(fontSize: 14.sp, color: Colors.white),
              errorText: state.emailError,
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
                size: 20.h,
              )),
             style: const TextStyle(color: Colors.white),     
        );
      },
    );
  }
}

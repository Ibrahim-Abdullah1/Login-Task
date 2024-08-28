
import 'package:bloc_login/bloc/login_bloc/login_cubits/login_cubit.dart';
import 'package:bloc_login/bloc/login_bloc/login_states/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(fontSize: 14.sp,color: Colors.white),
            errorText: state.passwordError,
            prefixIcon:  Icon(Icons.lock,color: Colors.white,size: 20.h,)
             ),
          obscureText: true,
          style: const TextStyle(color: Colors.white),
        );
      },
    );
  }
}
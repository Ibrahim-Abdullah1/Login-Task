// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import '../login_states/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _firebaseAuth;

  LoginCubit({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        super(const LoginState());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, emailError: _validateEmail(value)));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(
        password: value, passwordError: _validatePassword(value)));
  }

  Future<void> logInWithCredentials() async {
  final emailError = _validateEmail(state.email);
  final passwordError = _validatePassword(state.password);

  if (emailError != null || passwordError != null) {
    emit(state.copyWith(emailError: emailError, passwordError: passwordError));
    return;
  }

  emit(state.copyWith(isSubmitting: true));

  try {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: state.email,
      password: state.password,
    );
    emit(state.copyWith(
      isSubmitting: false,
      isSuccess: true,
      successMessage: 'Login successfully',
    ));
  } catch (error) {
    emit(state.copyWith(
      isSubmitting: false,
      errorMessage: _getErrorMessage(error),
    ));
  }
}

  String _getErrorMessage(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return 'No user found with this email.';
        case 'wrong-password':
          return 'Incorrect password. Please try again.';
        case 'invalid-email':
          return 'No user found with this email.';
        case 'invalid-credential':
          return 'incorrect password.';  
        case 'network-request-failed':
          return 'Network error. Please check your connection.';
        default:
          return 'An unknown error occurred.';
      }
    }
    return 'An unexpected error occurred. Please try again.';
  }

 String? _validateEmail(String email) {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (email.isEmpty) {
    return 'Email cannot be empty';
  } else if (!emailRegex.hasMatch(email)) {
    return 'Invalid email format';
  }
  return null;
}

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 6) {
      return 'Password too short';
    }
    return null;
  }
  
}

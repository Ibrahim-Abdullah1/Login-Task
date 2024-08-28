import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email;
  final String? emailError;
  final String password;
  final String? passwordError;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;
  final String? successMessage;

  const LoginState({
    this.email = '',
    this.emailError,
    this.password = '',
    this.passwordError,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
    this.successMessage,
  });

  LoginState copyWith({
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
    String? successMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      emailError: emailError,
      password: password ?? this.password,
      passwordError: passwordError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        emailError,
        password,
        passwordError,
        isSubmitting,
        isSuccess,
        errorMessage,
        successMessage,
      ];
}

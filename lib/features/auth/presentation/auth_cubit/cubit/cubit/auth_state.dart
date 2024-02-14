class AuthState {}

final class AuthInitial extends AuthState {}

final class SignupLoadingState extends AuthState {}

final class SignupSuccessState extends AuthState {}


final class SignupFailureState extends AuthState {
  final String errMessage ;

  SignupFailureState({required this.errMessage});
}


final class TermsAndConditionUpdateState extends AuthState {}
final class ObscurePasswordUpdateState extends AuthState {}


final class SignInLoadingState extends AuthState {}

final class SignInSuccessState extends AuthState {}


final class SignInFailureState extends AuthState {
  final String errMessage ;

  SignInFailureState({required this.errMessage});
}

final class ForgotPasswordLoadingState extends AuthState {}

final class ForgotPasswordSuccessState extends AuthState {}


final class ForgotPasswordFailureState extends AuthState {
  final String errMessage ;

  ForgotPasswordFailureState({required this.errMessage});
}
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final String phoneNumber;

  const RegisterEvent(this.email, this.password, this.phoneNumber);

  @override
  List<Object> get props => [email, password, phoneNumber];
}

class ResetPasswordEvent extends AuthenticationEvent {
  final String email;

  const ResetPasswordEvent(this.email);

  @override
  List<Object> get props => [email];
}

class OtpConfirmEmailEvent extends AuthenticationEvent {
  final String email;
  final String otp;

  const OtpConfirmEmailEvent(this.email, this.otp);

  @override
  List<Object> get props => [email, otp];
}

class OtpConfirmPhoneEvent extends AuthenticationEvent {
  final String phoneNumber;
  final String otp;

  const OtpConfirmPhoneEvent(this.phoneNumber, this.otp);

  @override
  List<Object> get props => [phoneNumber, otp];
}

class GetCachedAuthUserEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}

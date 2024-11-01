part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {}

class AuthenticationRegistrationSuccess extends AuthenticationState {}

class AuthenticationResetPasswordSuccess extends AuthenticationState {}

class AuthenticationOtpEmailConfirmed extends AuthenticationState {}

class AuthenticationOtpPhoneConfirmed extends AuthenticationState {}

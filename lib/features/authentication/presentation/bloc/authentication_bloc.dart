import 'package:falack_app/features/authentication/domain/entities/data_test.dart';
import 'package:falack_app/features/authentication/domain/usecases/canged_password_usecasse.dart';
import 'package:falack_app/features/authentication/domain/usecases/claer_cached_user_usecase.dart';
import 'package:falack_app/features/authentication/domain/usecases/email_otp_usecase.dart';
import 'package:falack_app/features/authentication/domain/usecases/get_cached_user_usecase.dart';
import 'package:falack_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:falack_app/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:falack_app/features/authentication/domain/usecases/phone_otp_usecase.dart';
import 'package:falack_app/features/authentication/domain/usecases/refersh_token_usecase.dart';
import 'package:falack_app/features/authentication/domain/usecases/resister_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUseCase loginUseCase;
  final RegisterUsecase registerUseCase;
  final LoginUseCase resetPasswordUseCase;
  final OtpConfirmEmailUseCase otpConfirmEmailUseCase;
  final OtpConfirmPhoneUseCase otpConfirmPhoneUseCase;
  final GetCachedAuthUserUseCase getCachedAuthUserUseCase;
  final ClearAuthUserUseCase clearAuthUserUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  final LogoutUseCase logoutUseCase;

  AuthenticationBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.resetPasswordUseCase,
    required this.otpConfirmEmailUseCase,
    required this.otpConfirmPhoneUseCase,
    required this.getCachedAuthUserUseCase,
    required this.clearAuthUserUseCase,
    required this.refreshTokenUseCase,
    required this.changePasswordUseCase,
    required this.logoutUseCase,
  }) : super(AuthenticationInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<ResetPasswordEvent>(_onResetPassword);
    on<OtpConfirmEmailEvent>(_onOtpConfirmEmail);
    on<OtpConfirmPhoneEvent>(_onOtpConfirmPhone);
    on<GetCachedAuthUserEvent>(_onGetCachedAuthUser);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final result = await loginUseCase(event.email, event.password);
    result.fold(
      (failure) => emit(AuthenticationError()),
      (authUser) => emit(AuthenticationAuthenticated()),
    );
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final result = await registerUseCase(event.email, event.password, event.phoneNumber);
    result.fold(
      (failure) => emit( AuthenticationError()),
      (_) => emit(AuthenticationRegistrationSuccess()),
    );
  }

  Future<void> _onResetPassword(ResetPasswordEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final result = await resetPasswordUseCase(event.email,"");
    result.fold(
      (failure) => emit( AuthenticationError()),
      (_) => emit(AuthenticationResetPasswordSuccess()),
    );
  }

  Future<void> _onOtpConfirmEmail(OtpConfirmEmailEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final result = await otpConfirmEmailUseCase(event.email, event.otp);
    result.fold(
      (failure) => emit( AuthenticationError()),
      (_) => emit(AuthenticationOtpEmailConfirmed()),
    );
  }

  Future<void> _onOtpConfirmPhone(OtpConfirmPhoneEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final result = await otpConfirmPhoneUseCase(event.phoneNumber, event.otp);
    result.fold(
      (failure) => emit( AuthenticationError()),
      (_) => emit(AuthenticationOtpPhoneConfirmed()),
    );
  }

  Future<void> _onGetCachedAuthUser(GetCachedAuthUserEvent event, Emitter<AuthenticationState> emit) async {
    final result = await getCachedAuthUserUseCase();
    result.fold(
      (failure) => emit( AuthenticationError()),
      (authUser) {
        if (authUser != null) {
          emit(AuthenticationAuthenticated());
        } else {
          emit(AuthenticationUnauthenticated());
        }
      },
    );
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthenticationState> emit) async {
    await logoutUseCase();
    emit(AuthenticationUnauthenticated());
  }
}

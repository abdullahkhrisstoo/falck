import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/authentication/domain/entities/data_test.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthUser>> login(String email, String password);
  Future<Either<Failure, void>> register(String email, String password, String phoneNumber);
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, void>> otpConfirmEmail(String email, String otp);
  Future<Either<Failure, void>> otpConfirmPhone(String phoneNumber, String otp);
  Future<Either<Failure, AuthUser?>> getCachedAuthUser();
  Future<Either<Failure, void>> clearAuthUser();
  
  // Additional methods
  Future<Either<Failure, AuthUser>> refreshToken(String token);
  Future<Either<Failure, void>> changePassword(String oldPassword, String newPassword);
  Future<Either<Failure, void>> logout();
}
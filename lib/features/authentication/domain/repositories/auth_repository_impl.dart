import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:falack_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:falack_app/features/authentication/data/repositories/authentication_reppsitory.dart';
import 'package:falack_app/features/authentication/domain/entities/data_test.dart';



class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, AuthUser>> login(String email, String password) async {
    try {
      final user = await remoteDataSource.login(email, password);
      await localDataSource.cacheAuthUser(user);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> register(String email, String password, String phoneNumber) async {
    try {
      await remoteDataSource.register(email, password, phoneNumber);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await remoteDataSource.resetPassword(email);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> otpConfirmEmail(String email, String otp) async {
    try {
      await remoteDataSource.otpConfirmEmail(email, otp);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> otpConfirmPhone(String phoneNumber, String otp) async {
    try {
      await remoteDataSource.otpConfirmPhone(phoneNumber, otp);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthUser?>> getCachedAuthUser() async {
    try {
      final cachedUser = await localDataSource.getCachedAuthUser();
      return Right(cachedUser);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clearAuthUser() async {
    try {
      await localDataSource.clearCachedAuthUser();
      return Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
  
  @override
  Future<Either<Failure, void>> changePassword(String oldPassword, String newPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, AuthUser>> refreshToken(String token) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}

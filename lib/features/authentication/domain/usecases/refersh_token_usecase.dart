import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/authentication/data/repositories/authentication_reppsitory.dart';
import 'package:falack_app/features/authentication/domain/entities/data_test.dart';


class RefreshTokenUseCase {
  final AuthRepository repository;

  RefreshTokenUseCase(this.repository);

  Future<Either<Failure, AuthUser>> call(String token) async {
    return await repository.refreshToken(token);
  }
}

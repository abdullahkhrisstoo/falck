import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/authentication/data/repositories/authentication_reppsitory.dart';
import 'package:falack_app/features/authentication/domain/entities/data_test.dart';


class GetCachedAuthUserUseCase {
  final AuthRepository repository;

  GetCachedAuthUserUseCase(this.repository);

  Future<Either<Failure, AuthUser?>> call() async {
    return await repository.getCachedAuthUser();
  }
}

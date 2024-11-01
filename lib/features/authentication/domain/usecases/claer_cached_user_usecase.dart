import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/authentication/data/repositories/authentication_reppsitory.dart';


class ClearAuthUserUseCase {
  final AuthRepository repository;

  ClearAuthUserUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.clearAuthUser();
  }
}

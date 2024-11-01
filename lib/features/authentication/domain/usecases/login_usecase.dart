import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/authentication/data/repositories/authentication_reppsitory.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, void>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}

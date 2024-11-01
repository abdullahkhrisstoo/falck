import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/authentication/data/repositories/authentication_reppsitory.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<Failure, void>> call(String email, String password,String phone) async {
    return await repository.register(email, password,phone);
  }
}

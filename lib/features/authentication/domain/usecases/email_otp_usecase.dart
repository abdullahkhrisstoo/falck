import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/authentication/data/repositories/authentication_reppsitory.dart';


class OtpConfirmEmailUseCase {
  final AuthRepository repository;

  OtpConfirmEmailUseCase(this.repository);

  Future<Either<Failure, void>> call(String email, String otp) async {
    return await repository.otpConfirmEmail(email, otp);
  }
}

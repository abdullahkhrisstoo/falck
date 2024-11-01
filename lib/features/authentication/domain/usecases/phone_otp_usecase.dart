import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/authentication/data/repositories/authentication_reppsitory.dart';

class OtpConfirmPhoneUseCase {
  final AuthRepository repository;

  OtpConfirmPhoneUseCase(this.repository);

  Future<Either<Failure, void>> call(String phoneNumber, String otp) async {
    return await repository.otpConfirmPhone(phoneNumber, otp);
  }
}

import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/core/usecases/usecase.dart';
import 'package:falack_app/features/on_boarding/data/models/on_boarding_step.dart';
import 'package:falack_app/features/on_boarding/domain/repositories/on_boarding_repository.dart';

class GetOnboardingSteps implements UseCase<List<OnboardingStep>, NoParams> {
  final OnboardingRepository repository;

  GetOnboardingSteps(this.repository);

  @override
  Future<Either<Failure, List<OnboardingStep>>> call(NoParams params) async {
    return await repository.getOnboardingSteps();
  }
}

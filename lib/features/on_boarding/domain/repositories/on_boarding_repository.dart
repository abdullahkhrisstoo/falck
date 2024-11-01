import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/on_boarding/data/models/on_boarding_step.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, List<OnboardingStep>>> getOnboardingSteps();
}

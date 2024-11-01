import 'package:equatable/equatable.dart';
import 'package:falack_app/features/on_boarding/data/models/on_boarding_step.dart';


abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];
}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingLoading extends OnBoardingState {}

class OnBoardingLoaded extends OnBoardingState {
  final List<OnboardingStep> steps;

  const OnBoardingLoaded({required this.steps});

  @override
  List<Object> get props => [steps];
}

class OnBoardingError extends OnBoardingState {
  final String message;

  const OnBoardingError(this.message);

  @override
  List<Object> get props => [message];
}

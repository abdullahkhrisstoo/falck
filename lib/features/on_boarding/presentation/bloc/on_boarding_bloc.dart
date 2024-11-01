
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/core/usecases/usecase.dart';
import 'package:falack_app/features/on_boarding/domain/usecases/get_onboarding_steps.dart';
import 'package:falack_app/features/on_boarding/presentation/bloc/on_boarding_event.dart';
import 'package:falack_app/features/on_boarding/presentation/bloc/on_boarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OnboardingBloc extends Bloc<OnboardingEvent, OnBoardingState> {
  final GetOnboardingSteps getOnboardingSteps;

  OnboardingBloc({required this.getOnboardingSteps}) : super(OnBoardingInitial()) {
    on<GetOnboardingStepsEvent>((event, emit) async {
      emit(OnBoardingLoading());

      final result = await getOnboardingSteps(NoParams());

      result.fold(
        (failure) => emit(OnBoardingError(_mapFailureToMessage(failure))),
        (steps) => emit(OnBoardingLoaded(steps: steps)),
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server Failure';
    } else if (failure is CacheFailure) {
      return 'Cache Failure';
    } else {
      return 'Unexpected Error';
    }
  }
}

import 'package:falack_app/core/cache/cache_helper.dart';
import 'package:falack_app/core/error/exceptions.dart';
import 'package:falack_app/features/on_boarding/data/models/on_boarding_step.dart';

abstract class OnboardingLocalDataSource {
  Future<List<OnboardingStep>> getCachedOnboardingSteps();
  Future<void> cacheOnboardingSteps(List<OnboardingStep> steps);
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  static const String CACHED_ONBOARDING_STEPS = "CACHED_ONBOARDING_STEPS";

  @override
  Future<List<OnboardingStep>> getCachedOnboardingSteps() async {
    final jsonData = CacheHelper.getJsonData(key: CACHED_ONBOARDING_STEPS);
    if (jsonData != null) {
      return (jsonData['steps'] as List)
          .map((json) => OnboardingStep.fromJson(json))
          .toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheOnboardingSteps(List<OnboardingStep> steps) async {
    final jsonData = {'steps': steps.map((step) => step.toJson()).toList()};
    await CacheHelper.saveJsonData(
        key: CACHED_ONBOARDING_STEPS, jsonData: jsonData);
  }
}

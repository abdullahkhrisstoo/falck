import 'package:dio/dio.dart';
import 'package:falack_app/core/error/exceptions.dart';
import 'package:falack_app/features/on_boarding/data/models/on_boarding_step.dart';

abstract class OnboardingRemoteDataSource {
  /// Calls the remote API to get onboarding steps
  Future<List<OnboardingStep>> getRemoteOnboardingSteps();
}

class OnboardingRemoteDataSourceImpl implements OnboardingRemoteDataSource {
  final Dio dio;

  OnboardingRemoteDataSourceImpl({required this.dio, r});

  static const String ONBOARDING_ENDPOINT = "https://yourapi.com/onboarding";

  @override
  Future<List<OnboardingStep>> getRemoteOnboardingSteps() async {
    try {
      // Send a GET request to the onboarding endpoint
      final response = await dio.get(ONBOARDING_ENDPOINT);
      
      if (response.statusCode == 200) {
        // Assuming the data is a list of steps in the response body
        final data = response.data as List;

        // Convert each item into an OnboardingStep using fromJson
        return data.map((json) => OnboardingStep.fromJson(json)).toList();
      } else {
        throw const ServerException(); // Custom exception for server errors
      }
    } on DioError  {
      // Handle Dio-specific errors, map to a custom exception
      throw const ServerException();
    }
  }
}

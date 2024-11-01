import 'package:dio/dio.dart';
import 'package:falack_app/features/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:falack_app/features/on_boarding/data/datasources/on_boarding_remote_data_source.dart';
import 'package:falack_app/features/on_boarding/data/repositories/onboarding_repository.dart';
import 'package:falack_app/features/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:falack_app/features/on_boarding/domain/usecases/get_onboarding_steps.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:falack_app/core/api/api_consumer.dart';
import 'package:falack_app/core/api/app_interceptir.dart';
import 'package:falack_app/core/api/dio_consumer.dart';
import 'package:falack_app/core/network/netwok_info.dart';
import 'package:falack_app/features/test/test_local_data_source.dart';
import 'package:falack_app/features/test/test_remote_data_source.dart';
import 'package:falack_app/features/test/test_i_repo.dart';
import 'package:falack_app/features/test/test_repo.dart';
import 'package:falack_app/features/test/use_case_test.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  //todo: Blocs
  // sl.registerFactory<RandomQuoteCubit>(
  //     () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));
  // sl.registerFactory<LocaleCubit>(
  //     () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => BenefitUseCase(benefitRepository: sl()));

  // Repository
  sl.registerLazySingleton<IBenefitRepository>(() => BenefitRepositoryImpl(
        networkInfo: sl(),
         benefitRemoteDataSource: sl(),
         benefitLocalDataSource: sl(),
      ));

  //todo: Data Sources
  sl.registerLazySingleton<BenefitLocalDataSource>(
      () => BenefitLocalDataSourceImpl());
  sl.registerLazySingleton<BenefitRemoteDataSource>(
      () => BenefitRemoteDataSourceImpl(apiConsumer: sl()));

  //todo: Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //todo: External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppIntercepters());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());


  // todo:on boarding
    sl.registerLazySingleton(() => GetOnboardingSteps(sl()));

  // Repository
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<OnboardingRemoteDataSource>(
    () => OnboardingRemoteDataSourceImpl(dio: sl(),  ),
  );
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(),
  );
}

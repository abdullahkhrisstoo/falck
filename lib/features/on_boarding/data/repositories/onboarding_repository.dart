import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/exceptions.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/core/network/netwok_info.dart';
import 'package:falack_app/features/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:falack_app/features/on_boarding/data/datasources/on_boarding_remote_data_source.dart';
import 'package:falack_app/features/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:falack_app/features/on_boarding/data/models/on_boarding_step.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource remoteDataSource;
  final OnboardingLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  OnboardingRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<OnboardingStep>>> getOnboardingSteps() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteSteps = await remoteDataSource.getRemoteOnboardingSteps();
        localDataSource.cacheOnboardingSteps(remoteSteps);
        return Right(remoteSteps);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localSteps = await localDataSource.getCachedOnboardingSteps();
        return Right(localSteps);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}

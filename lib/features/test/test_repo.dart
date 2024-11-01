import 'package:dartz/dartz.dart';
import 'package:falack_app/core/dto/create/create_benefit_dto.dart';
import 'package:falack_app/core/dto/get/benefit_dto.dart';
import 'package:falack_app/core/dto/update/update_benefit_dto.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/core/network/netwok_info.dart';
import 'package:falack_app/features/test/test_i_repo.dart';
import 'package:falack_app/features/test/test_local_data_source.dart';
import 'package:falack_app/features/test/test_remote_data_source.dart';


class BenefitRepositoryImpl implements IBenefitRepository {
  final NetworkInfo networkInfo;
  final BenefitRemoteDataSource benefitRemoteDataSource;
  final BenefitLocalDataSource benefitLocalDataSource;

  BenefitRepositoryImpl({
    required this.networkInfo,
    required this.benefitRemoteDataSource,
    required this.benefitLocalDataSource,
  });

  // Method implementations
  
  @override
  Future<Either<Failure, List<BenefitDTO>>> GetAllBenefitsAsync() async {
    if (await networkInfo.isConnected) {
      return await _performRemoteOperation(() => benefitRemoteDataSource.GetAllBenefitsAsync());
    } else {
      try {
        // final cachedData = await benefitLocalDataSource.GetAllBenefitsAsync;
        return Left(CacheFailure());
        // return Right(cachedData);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }
  
  @override
  Future<Either<Failure, BenefitDTO>> GetBenefitByIdAsync(int id) async {
    return await _performRemoteOperation(() => benefitRemoteDataSource.GetBenefitByIdAsync(id));
  }
  
  @override
  Future<Either<Failure, BenefitDTO>> CreateBenefitAsync(CreateBenefitDTO benefitDto) async {
    return await _performRemoteOperation(() => benefitRemoteDataSource.CreateBenefitAsync(benefitDto));
  }
  
  @override
  Future<Either<Failure, BenefitDTO>> UpdateBenefitAsync(UpdateBenefitDTO benefitDto) async {
    return await _performRemoteOperation(() => benefitRemoteDataSource.UpdateBenefitAsync(benefitDto));
  }
  
  @override
  Future<Either<Failure, bool>> DeleteBenefitAsync(int id) async {
    return await _performRemoteOperation(() => benefitRemoteDataSource.DeleteBenefitAsync(id));
  }

  Future<Either<Failure, T>> _performRemoteOperation<T>(Future<T> Function() operation) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await operation();
        return Right(result);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}


import 'package:dartz/dartz.dart';
import 'package:falack_app/features/test/test_i_repo.dart';
import '../../../../../core/error/failures.dart';
import 'package:falack_app/core/dto/create/create_benefit_dto.dart';
import 'package:falack_app/core/dto/get/benefit_dto.dart';
import 'package:falack_app/core/dto/update/update_benefit_dto.dart';

class BenefitUseCase {
  final IBenefitRepository benefitRepository;
  BenefitUseCase({required this.benefitRepository});

  Future<Either<Failure, List<BenefitDTO>>> getAllBenefits() =>benefitRepository.GetAllBenefitsAsync();

  Future<Either<Failure, BenefitDTO>> getBenefitById(int id) => benefitRepository.GetBenefitByIdAsync(id);

  Future<Either<Failure, BenefitDTO>> createBenefit(CreateBenefitDTO benefitDto) =>benefitRepository.CreateBenefitAsync(benefitDto);

  Future<Either<Failure, BenefitDTO>> updateBenefit(UpdateBenefitDTO benefitDto) =>benefitRepository.UpdateBenefitAsync(benefitDto);

  Future<Either<Failure, bool>> deleteBenefit(int id) =>benefitRepository.DeleteBenefitAsync(id);
}

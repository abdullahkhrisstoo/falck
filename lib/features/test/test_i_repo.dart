import 'package:dartz/dartz.dart';
import 'package:falack_app/core/dto/create/create_benefit_dto.dart';
import 'package:falack_app/core/dto/get/benefit_dto.dart';
import 'package:falack_app/core/dto/update/update_benefit_dto.dart';
import 'package:falack_app/core/error/failures.dart';


abstract class IBenefitRepository
{
Future<Either<Failure,List<BenefitDTO>>> GetAllBenefitsAsync();
Future<Either<Failure,BenefitDTO>> GetBenefitByIdAsync(int id);
Future<Either<Failure,BenefitDTO>> CreateBenefitAsync(CreateBenefitDTO benefitDto);
Future<Either<Failure,BenefitDTO>> UpdateBenefitAsync(UpdateBenefitDTO benefitDto);
Future<Either<Failure,bool>> DeleteBenefitAsync(int id);
}

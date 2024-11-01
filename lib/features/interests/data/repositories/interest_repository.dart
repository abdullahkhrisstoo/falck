import 'package:dartz/dartz.dart';
import 'package:falack_app/core/error/failures.dart';
import 'package:falack_app/features/interests/data/models/category.dart';
import 'package:falack_app/features/interests/data/models/interest.dart';


abstract class InterestRepository {
  Future<Either<Failure, List<Interest>>> getAvailableInterests();

  Future<Either<Failure, void>> pickMainCategory(Category category);

  Future<Either<Failure, void>> selectAdditionalInterests(List<Interest> interests);
}

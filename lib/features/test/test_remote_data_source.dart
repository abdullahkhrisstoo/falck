import 'package:falack_app/core/api/api_consumer.dart';
import 'package:falack_app/core/dto/create/create_benefit_dto.dart';
import 'package:falack_app/core/dto/get/benefit_dto.dart';
import 'package:falack_app/core/dto/update/update_benefit_dto.dart';


abstract class BenefitRemoteDataSource {
    Future<List<BenefitDTO>> GetAllBenefitsAsync();
    Future<BenefitDTO> GetBenefitByIdAsync(int id);
    Future<BenefitDTO> CreateBenefitAsync(CreateBenefitDTO benefitDto);
    Future<BenefitDTO> UpdateBenefitAsync(UpdateBenefitDTO benefitDto);
    Future<bool> DeleteBenefitAsync(int id);
}


class BenefitRemoteDataSourceImpl implements BenefitRemoteDataSource {
  final ApiConsumer apiConsumer;

  BenefitRemoteDataSourceImpl({required this.apiConsumer});

  
@override
Future<List<BenefitDTO>> GetAllBenefitsAsync() async {
    final response = await apiConsumer.get(
      'benefit/GetAllBenefits'
    );
    final data = response.data as List<dynamic>;
    return data.map((e) => BenefitDTO.fromJson(e as Map<String, dynamic>)).toList();
}
  
@override
Future<BenefitDTO> GetBenefitByIdAsync(int id) async {
    final response = await apiConsumer.get(
      'benefit/GetBenefitById', queryParameters: { 'id': id }
    );
    return BenefitDTO.fromJson(response.data as Map<String, dynamic>);
}
  
@override
Future<BenefitDTO> CreateBenefitAsync(CreateBenefitDTO benefitDto) async {
    final response = await apiConsumer.post(
      'benefit/CreateBenefit', body: benefitDto.toJson()
    );
    return BenefitDTO.fromJson(response.data as Map<String, dynamic>);
}
  
@override
Future<BenefitDTO> UpdateBenefitAsync(UpdateBenefitDTO benefitDto) async {
    final response = await apiConsumer.put(
      'benefit/UpdateBenefit', body: benefitDto.toJson()
    );
    return BenefitDTO.fromJson(response.data as Map<String, dynamic>);
}
  
@override
Future<bool> DeleteBenefitAsync(int id) async {
    final response = await apiConsumer.delete(
      'benefit/DeleteBenefit', queryParameters: { 'id': id }
    );
    return response.data as bool;
}
}



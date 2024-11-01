class CreateBenefitByTypeDTO {
  int? benefitId;
  int? vehicleTypeId;
  int? tripCategoryId;

  CreateBenefitByTypeDTO({
    this.benefitId,
    this.vehicleTypeId,
    this.tripCategoryId,
  });

  // Factory method to create an instance of CreateBenefitByTypeDTO from JSON
  factory CreateBenefitByTypeDTO.fromJson(Map<String, dynamic> json) {
    return CreateBenefitByTypeDTO(
      benefitId: json['benefitId'] as int?,
      vehicleTypeId: json['vehicleTypeId'] as int?,
      tripCategoryId: json['tripCategoryId'] as int?,
    );
  }

  // Method to convert an instance of CreateBenefitByTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'benefitId': benefitId,
      'vehicleTypeId': vehicleTypeId,
      'tripCategoryId': tripCategoryId,
    };
  }
}

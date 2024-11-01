class UpdateBenefitByTypeDTO {
  int benefitByTypesId;
  int? benefitId;
  int? vehicleTypeId;
  int? tripCategoryId;
  DateTime? updatedAt;

  UpdateBenefitByTypeDTO({
    required this.benefitByTypesId,
    this.benefitId,
    this.vehicleTypeId,
    this.tripCategoryId,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateBenefitByTypeDTO from JSON
  factory UpdateBenefitByTypeDTO.fromJson(Map<String, dynamic> json) {
    return UpdateBenefitByTypeDTO(
      benefitByTypesId: json['benefitByTypesId'] as int,
      benefitId: json['benefitId'] as int?,
      vehicleTypeId: json['vehicleTypeId'] as int?,
      tripCategoryId: json['tripCategoryId'] as int?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateBenefitByTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'benefitByTypesId': benefitByTypesId,
      'benefitId': benefitId,
      'vehicleTypeId': vehicleTypeId,
      'tripCategoryId': tripCategoryId,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

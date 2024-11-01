class BenefitByTypeDTO {
  int benefitByTypesId;
  int? benefitId;
  int? vehicleTypeId;
  int? tripCategoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  BenefitByTypeDTO({
    required this.benefitByTypesId,
    this.benefitId,
    this.vehicleTypeId,
    this.tripCategoryId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of BenefitByTypeDTO from JSON
  factory BenefitByTypeDTO.fromJson(Map<String, dynamic> json) {
    return BenefitByTypeDTO(
      benefitByTypesId: json['benefitByTypesId'] as int,
      benefitId: json['benefitId'] as int?,
      vehicleTypeId: json['vehicleTypeId'] as int?,
      tripCategoryId: json['tripCategoryId'] as int?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }

  // Method to convert an instance of BenefitByTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'benefitByTypesId': benefitByTypesId,
      'benefitId': benefitId,
      'vehicleTypeId': vehicleTypeId,
      'tripCategoryId': tripCategoryId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

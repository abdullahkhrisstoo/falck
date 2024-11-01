class UpdateBenefitDTO {
  int benefitId;
  num? rate;
  DateTime? fromDatetime;
  DateTime? toDatatime;
  DateTime? updatedAt;

  UpdateBenefitDTO({
    required this.benefitId,
    this.rate,
    this.fromDatetime,
    this.toDatatime,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateBenefitDTO from JSON
  factory UpdateBenefitDTO.fromJson(Map<String, dynamic> json) {
    return UpdateBenefitDTO(
      benefitId: json['benefitId'] as int,
      rate: json['rate'] as num?,
      fromDatetime: json['fromDatetime'] != null
          ? DateTime.parse(json['fromDatetime'] as String)
          : null,
      toDatatime: json['toDatatime'] != null
          ? DateTime.parse(json['toDatatime'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateBenefitDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'benefitId': benefitId,
      'rate': rate,
      'fromDatetime': fromDatetime?.toIso8601String(),
      'toDatatime': toDatatime?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

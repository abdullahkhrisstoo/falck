class BenefitDTO {
  int benefitId;
  double? rate;
  DateTime? createdDatetime;
  DateTime? fromDatetime;
  DateTime? toDatetime;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  BenefitDTO({
    required this.benefitId,
    this.rate,
    this.createdDatetime,
    this.fromDatetime,
    this.toDatetime,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of BenefitDTO from JSON
  factory BenefitDTO.fromJson(Map<String, dynamic> json) {
    return BenefitDTO(
      benefitId: json['benefitId'] as int,
      rate: (json['rate'] as num?)?.toDouble(),
      createdDatetime: json['createdDatetime'] != null ? DateTime.parse(json['createdDatetime']) : null,
      fromDatetime: json['fromDatetime'] != null ? DateTime.parse(json['fromDatetime']) : null,
      toDatetime: json['toDatetime'] != null ? DateTime.parse(json['toDatetime']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }

  // Method to convert an instance of BenefitDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'benefitId': benefitId,
      'rate': rate,
      'createdDatetime': createdDatetime?.toIso8601String(),
      'fromDatetime': fromDatetime?.toIso8601String(),
      'toDatetime': toDatetime?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

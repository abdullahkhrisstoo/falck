class CreateBenefitDTO {
  double? rate;
  DateTime? fromDatetime;
  DateTime? toDatetime;

  CreateBenefitDTO({
    this.rate,
    this.fromDatetime,
    this.toDatetime,
  });

  // Factory method to create an instance of CreateBenefitDTO from JSON
  factory CreateBenefitDTO.fromJson(Map<String, dynamic> json) {
    return CreateBenefitDTO(
      rate: (json['rate'] as num?)?.toDouble(),
      fromDatetime: json['fromDatetime'] != null ? DateTime.parse(json['fromDatetime']) : null,
      toDatetime: json['toDatetime'] != null ? DateTime.parse(json['toDatetime']) : null,
    );
  }

  // Method to convert an instance of CreateBenefitDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'fromDatetime': fromDatetime?.toIso8601String(),
      'toDatetime': toDatetime?.toIso8601String(),
    };
  }
}

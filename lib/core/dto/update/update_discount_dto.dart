class UpdateDiscountDTO {
  int discountId;
  String? codeNumber;
  num? rate; // Use `num` to cover both `int` and `double`
  DateTime? fromDatetime;
  DateTime? toDatetime;
  DateTime? updatedAt;

  UpdateDiscountDTO({
    required this.discountId,
    this.codeNumber,
    this.rate,
    this.fromDatetime,
    this.toDatetime,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateDiscountDTO from JSON
  factory UpdateDiscountDTO.fromJson(Map<String, dynamic> json) {
    return UpdateDiscountDTO(
      discountId: json['discountId'] as int,
      codeNumber: json['codeNumber'] as String?,
      rate: json['rate'] != null ? json['rate'] as num : null,
      fromDatetime: json['fromDatetime'] != null
          ? DateTime.parse(json['fromDatetime'] as String)
          : null,
      toDatetime: json['toDatetime'] != null
          ? DateTime.parse(json['toDatetime'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateDiscountDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'discountId': discountId,
      'codeNumber': codeNumber,
      'rate': rate,
      'fromDatetime': fromDatetime?.toIso8601String(),
      'toDatetime': toDatetime?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

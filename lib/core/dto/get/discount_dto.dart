class DiscountDTO {
  int discountId;
  String? codeNumber;
  double? rate;
  DateTime? createdDatetime;
  DateTime? fromDatetime;
  DateTime? toDatetime;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  DiscountDTO({
    required this.discountId,
    this.codeNumber,
    this.rate,
    this.createdDatetime,
    this.fromDatetime,
    this.toDatetime,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of DiscountDTO from JSON
  factory DiscountDTO.fromJson(Map<String, dynamic> json) {
    return DiscountDTO(
      discountId: json['discountId'] as int,
      codeNumber: json['codeNumber'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      createdDatetime: json['createdDatetime'] != null
          ? DateTime.parse(json['createdDatetime'] as String)
          : null,
      fromDatetime: json['fromDatetime'] != null
          ? DateTime.parse(json['fromDatetime'] as String)
          : null,
      toDatetime: json['toDatetime'] != null
          ? DateTime.parse(json['toDatetime'] as String)
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of DiscountDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'discountId': discountId,
      'codeNumber': codeNumber,
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

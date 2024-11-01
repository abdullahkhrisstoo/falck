class BrandDTO {
  int brandId;
  String? brandName;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  BrandDTO({
    required this.brandId,
    this.brandName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of BrandDTO from JSON
  factory BrandDTO.fromJson(Map<String, dynamic> json) {
    return BrandDTO(
      brandId: json['brandId'] as int,
      brandName: json['brandName'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }

  // Method to convert an instance of BrandDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'brandName': brandName,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

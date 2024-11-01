class UpdateBrandDTO {
  int brandId;
  String? brandName;
  DateTime? updatedAt;

  UpdateBrandDTO({
    required this.brandId,
    this.brandName,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateBrandDTO from JSON
  factory UpdateBrandDTO.fromJson(Map<String, dynamic> json) {
    return UpdateBrandDTO(
      brandId: json['brandId'] as int,
      brandName: json['brandName'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateBrandDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'brandName': brandName,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

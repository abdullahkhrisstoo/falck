class UpdateTripCategoryDTO {
  int tripCategoryId;
  String? categoryNameAr;
  String? categoryNameEn;
  DateTime? updatedAt;

  UpdateTripCategoryDTO({
    required this.tripCategoryId,
    this.categoryNameAr,
    this.categoryNameEn,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateTripCategoryDTO from JSON
  factory UpdateTripCategoryDTO.fromJson(Map<String, dynamic> json) {
    return UpdateTripCategoryDTO(
      tripCategoryId: json['tripCategoryId'] as int,
      categoryNameAr: json['categoryNameAr'] as String?,
      categoryNameEn: json['categoryNameEn'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateTripCategoryDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripCategoryId': tripCategoryId,
      'categoryNameAr': categoryNameAr,
      'categoryNameEn': categoryNameEn,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

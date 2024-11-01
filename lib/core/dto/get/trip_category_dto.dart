class TripCategoryDTO {
  int tripCategoryId;
  String? categoryNameAr;
  String? categoryNameEn;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  TripCategoryDTO({
    required this.tripCategoryId,
    this.categoryNameAr,
    this.categoryNameEn,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of TripCategoryDTO from JSON
  factory TripCategoryDTO.fromJson(Map<String, dynamic> json) {
    return TripCategoryDTO(
      tripCategoryId: json['tripCategoryId'] as int,
      categoryNameAr: json['categoryNameAr'] as String?,
      categoryNameEn: json['categoryNameEn'] as String?,
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

  // Method to convert an instance of TripCategoryDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripCategoryId': tripCategoryId,
      'categoryNameAr': categoryNameAr,
      'categoryNameEn': categoryNameEn,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

class TripTypeDTO {
  int tripTypeId;
  String? typeNameAr;
  String? typeNameEn;
  int? tripCategoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  TripTypeDTO({
    required this.tripTypeId,
    this.typeNameAr,
    this.typeNameEn,
    this.tripCategoryId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of TripTypeDTO from JSON
  factory TripTypeDTO.fromJson(Map<String, dynamic> json) {
    return TripTypeDTO(
      tripTypeId: json['tripTypeId'] as int,
      typeNameAr: json['typeNameAr'] as String?,
      typeNameEn: json['typeNameEn'] as String?,
      tripCategoryId: json['tripCategoryId'] as int?,
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

  // Method to convert an instance of TripTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripTypeId': tripTypeId,
      'typeNameAr': typeNameAr,
      'typeNameEn': typeNameEn,
      'tripCategoryId': tripCategoryId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

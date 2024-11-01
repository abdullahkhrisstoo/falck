class UpdateTripTypeDTO {
  int tripTypeId;
  String? typeNameAr;
  String? typeNameEn;
  int? tripCategoryId;
  DateTime? updatedAt;

  UpdateTripTypeDTO({
    required this.tripTypeId,
    this.typeNameAr,
    this.typeNameEn,
    this.tripCategoryId,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateTripTypeDTO from JSON
  factory UpdateTripTypeDTO.fromJson(Map<String, dynamic> json) {
    return UpdateTripTypeDTO(
      tripTypeId: json['tripTypeId'] as int,
      typeNameAr: json['typeNameAr'] as String?,
      typeNameEn: json['typeNameEn'] as String?,
      tripCategoryId: json['tripCategoryId'] as int?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateTripTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripTypeId': tripTypeId,
      'typeNameAr': typeNameAr,
      'typeNameEn': typeNameEn,
      'tripCategoryId': tripCategoryId,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

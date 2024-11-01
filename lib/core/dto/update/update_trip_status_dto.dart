class UpdateTripStatusDTO {
  int tripStatusId;
  String? statusNameAr;
  String? statusNameEn;
  int? tripCategoryId;
  DateTime? updatedAt;

  UpdateTripStatusDTO({
    required this.tripStatusId,
    this.statusNameAr,
    this.statusNameEn,
    this.tripCategoryId,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateTripStatusDTO from JSON
  factory UpdateTripStatusDTO.fromJson(Map<String, dynamic> json) {
    return UpdateTripStatusDTO(
      tripStatusId: json['tripStatusId'] as int,
      statusNameAr: json['statusNameAr'] as String?,
      statusNameEn: json['statusNameEn'] as String?,
      tripCategoryId: json['tripCategoryId'] as int?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateTripStatusDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripStatusId': tripStatusId,
      'statusNameAr': statusNameAr,
      'statusNameEn': statusNameEn,
      'tripCategoryId': tripCategoryId,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class TripStatusDTO {
  int tripStatusId;
  String? statusNameAr;
  String? statusNameEn;
  int? tripCategoryId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  TripStatusDTO({
    required this.tripStatusId,
    this.statusNameAr,
    this.statusNameEn,
    this.tripCategoryId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of TripStatusDTO from JSON
  factory TripStatusDTO.fromJson(Map<String, dynamic> json) {
    return TripStatusDTO(
      tripStatusId: json['tripStatusId'] as int,
      statusNameAr: json['statusNameAr'] as String?,
      statusNameEn: json['statusNameEn'] as String?,
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

  // Method to convert an instance of TripStatusDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripStatusId': tripStatusId,
      'statusNameAr': statusNameAr,
      'statusNameEn': statusNameEn,
      'tripCategoryId': tripCategoryId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

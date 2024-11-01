class CountryDTO {
  int countryId;
  String? countryName;
  String? countryNameAr;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  CountryDTO({
    required this.countryId,
    this.countryName,
    this.countryNameAr,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of CountryDTO from JSON
  factory CountryDTO.fromJson(Map<String, dynamic> json) {
    return CountryDTO(
      countryId: json['countryId'] as int,
      countryName: json['countryName'] as String?,
      countryNameAr: json['countryNameAr'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }

  // Method to convert an instance of CountryDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'countryId': countryId,
      'countryName': countryName,
      'countryNameAr': countryNameAr,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

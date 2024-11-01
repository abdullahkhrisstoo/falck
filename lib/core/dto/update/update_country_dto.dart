class UpdateCountryDTO {
  int countryId;
  String? countryName;
  String? countryNameAr;
  DateTime? updatedAt;

  UpdateCountryDTO({
    required this.countryId,
    this.countryName,
    this.countryNameAr,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateCountryDTO from JSON
  factory UpdateCountryDTO.fromJson(Map<String, dynamic> json) {
    return UpdateCountryDTO(
      countryId: json['countryId'] as int,
      countryName: json['countryName'] as String?,
      countryNameAr: json['countryNameAr'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateCountryDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'countryId': countryId,
      'countryName': countryName,
      'countryNameAr': countryNameAr,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

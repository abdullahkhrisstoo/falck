class UpdateCityDTO {
  int cityId;
  String? cityNameAr;
  String? cityNameEn;
  int? countryId;
  DateTime? updatedAt;

  UpdateCityDTO({
    required this.cityId,
    this.cityNameAr,
    this.cityNameEn,
    this.countryId,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateCityDTO from JSON
  factory UpdateCityDTO.fromJson(Map<String, dynamic> json) {
    return UpdateCityDTO(
      cityId: json['cityId'] as int,
      cityNameAr: json['cityNameAr'] as String?,
      cityNameEn: json['cityNameEn'] as String?,
      countryId: json['countryId'] as int?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateCityDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'cityId': cityId,
      'cityNameAr': cityNameAr,
      'cityNameEn': cityNameEn,
      'countryId': countryId,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

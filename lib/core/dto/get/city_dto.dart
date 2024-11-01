class CityDTO {
  int cityId;
  String? cityNameAr;
  String? cityNameEn;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  int? countryId;

  CityDTO({
    required this.cityId,
    this.cityNameAr,
    this.cityNameEn,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.countryId,
  });

  // Factory method to create an instance of CityDTO from JSON
  factory CityDTO.fromJson(Map<String, dynamic> json) {
    return CityDTO(
      cityId: json['cityId'] as int,
      cityNameAr: json['cityNameAr'] as String?,
      cityNameEn: json['cityNameEn'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
      countryId: json['countryId'] as int?,
    );
  }

  // Method to convert an instance of CityDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'cityId': cityId,
      'cityNameAr': cityNameAr,
      'cityNameEn': cityNameEn,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'countryId': countryId,
    };
  }
}

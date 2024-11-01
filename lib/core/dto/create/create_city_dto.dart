class CreateCityDTO {
  String? cityNameAr;
  String? cityNameEn;
  int? countryId;

  CreateCityDTO({
    this.cityNameAr,
    this.cityNameEn,
    this.countryId,
  });

  // Factory method to create an instance of CreateCityDTO from JSON
  factory CreateCityDTO.fromJson(Map<String, dynamic> json) {
    return CreateCityDTO(
      cityNameAr: json['cityNameAr'] as String?,
      cityNameEn: json['cityNameEn'] as String?,
      countryId: json['countryId'] as int?,
    );
  }

  // Method to convert an instance of CreateCityDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'cityNameAr': cityNameAr,
      'cityNameEn': cityNameEn,
      'countryId': countryId,
    };
  }
}

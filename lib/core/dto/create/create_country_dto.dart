class CreateCountryDTO {
  String? countryName;
  String? countryNameAr;

  CreateCountryDTO({
    this.countryName,
    this.countryNameAr,
  });

  // Factory method to create an instance of CreateCountryDTO from JSON
  factory CreateCountryDTO.fromJson(Map<String, dynamic> json) {
    return CreateCountryDTO(
      countryName: json['countryName'] as String?,
      countryNameAr: json['countryNameAr'] as String?,
    );
  }

  // Method to convert an instance of CreateCountryDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'countryName': countryName,
      'countryNameAr': countryNameAr,
    };
  }
}

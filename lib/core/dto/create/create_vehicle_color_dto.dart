class CreateVehicleColorDTO {
  String? colorAr;
  String? colorEn;

  CreateVehicleColorDTO({
    this.colorAr,
    this.colorEn,
  });

  // Factory method to create an instance of CreateVehicleColorDTO from JSON
  factory CreateVehicleColorDTO.fromJson(Map<String, dynamic> json) {
    return CreateVehicleColorDTO(
      colorAr: json['colorAr'] as String?,
      colorEn: json['colorEn'] as String?,
    );
  }

  // Method to convert an instance of CreateVehicleColorDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'colorAr': colorAr,
      'colorEn': colorEn,
    };
  }
}

class UpdateVehicleColorDTO {
  int vehicleColorId;
  String? colorAr;
  String? colorEn;
  DateTime? updatedAt;

  UpdateVehicleColorDTO({
    required this.vehicleColorId,
    this.colorAr,
    this.colorEn,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateVehicleColorDTO from JSON
  factory UpdateVehicleColorDTO.fromJson(Map<String, dynamic> json) {
    return UpdateVehicleColorDTO(
      vehicleColorId: json['vehicleColorId'] as int,
      colorAr: json['colorAr'] as String?,
      colorEn: json['colorEn'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateVehicleColorDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleColorId': vehicleColorId,
      'colorAr': colorAr,
      'colorEn': colorEn,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

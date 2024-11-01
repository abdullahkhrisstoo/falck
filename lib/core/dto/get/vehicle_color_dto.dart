class VehicleColorDTO {
  int vehicleColorId;
  String? colorAr;
  String? colorEn;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;

  VehicleColorDTO({
    required this.vehicleColorId,
    this.colorAr,
    this.colorEn,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  // Factory method to create an instance of VehicleColorDTO from JSON
  factory VehicleColorDTO.fromJson(Map<String, dynamic> json) {
    return VehicleColorDTO(
      vehicleColorId: json['vehicleColorId'] as int,
      colorAr: json['colorAr'] as String?,
      colorEn: json['colorEn'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of VehicleColorDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleColorId': vehicleColorId,
      'colorAr': colorAr,
      'colorEn': colorEn,
      'createdAt': createdAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

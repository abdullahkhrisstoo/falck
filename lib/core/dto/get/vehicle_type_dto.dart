class VehicleTypeDTO {
  int vehicleTypeId;
  String? vehicleTypeName;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;

  VehicleTypeDTO({
    required this.vehicleTypeId,
    this.vehicleTypeName,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  // Factory method to create an instance of VehicleTypeDTO from JSON
  factory VehicleTypeDTO.fromJson(Map<String, dynamic> json) {
    return VehicleTypeDTO(
      vehicleTypeId: json['vehicleTypeId'] as int,
      vehicleTypeName: json['vehicleTypeName'] as String?,
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

  // Method to convert an instance of VehicleTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleTypeId': vehicleTypeId,
      'vehicleTypeName': vehicleTypeName,
      'createdAt': createdAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class UpdateVehicleTypeDTO {
  int vehicleTypeId;
  String? vehicleTypeName;
  DateTime? updatedAt;

  UpdateVehicleTypeDTO({
    required this.vehicleTypeId,
    this.vehicleTypeName,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateVehicleTypeDTO from JSON
  factory UpdateVehicleTypeDTO.fromJson(Map<String, dynamic> json) {
    return UpdateVehicleTypeDTO(
      vehicleTypeId: json['vehicleTypeId'] as int,
      vehicleTypeName: json['vehicleTypeName'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateVehicleTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleTypeId': vehicleTypeId,
      'vehicleTypeName': vehicleTypeName,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

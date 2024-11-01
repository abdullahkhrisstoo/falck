class CreateVehicleTypeDTO {
  String? vehicleTypeName;

  CreateVehicleTypeDTO({
    this.vehicleTypeName,
  });

  // Factory method to create an instance of CreateVehicleTypeDTO from JSON
  factory CreateVehicleTypeDTO.fromJson(Map<String, dynamic> json) {
    return CreateVehicleTypeDTO(
      vehicleTypeName: json['vehicleTypeName'] as String?,
    );
  }

  // Method to convert an instance of CreateVehicleTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleTypeName': vehicleTypeName,
    };
  }
}

class UpdateVehicleDTO {
  int vehicleId;
  int? brandModelId;
  int? year;
  int? seatsTally;
  int? colorId;
  int? vehicleTypeId;
  DateTime? updatedAt;

  UpdateVehicleDTO({
    required this.vehicleId,
    this.brandModelId,
    this.year,
    this.seatsTally,
    this.colorId,
    this.vehicleTypeId,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateVehicleDTO from JSON
  factory UpdateVehicleDTO.fromJson(Map<String, dynamic> json) {
    return UpdateVehicleDTO(
      vehicleId: json['vehicleId'] as int,
      brandModelId: json['brandModelId'] as int?,
      year: json['year'] as int?,
      seatsTally: json['seatsTally'] as int?,
      colorId: json['colorId'] as int?,
      vehicleTypeId: json['vehicleTypeId'] as int?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateVehicleDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'brandModelId': brandModelId,
      'year': year,
      'seatsTally': seatsTally,
      'colorId': colorId,
      'vehicleTypeId': vehicleTypeId,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

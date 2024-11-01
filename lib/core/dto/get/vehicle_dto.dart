class VehicleDTO {
  int vehicleId;
  int? brandModelId;
  int? year;
  int? seatsTally;
  int? colorId;
  int? vehicleTypeId;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;

  VehicleDTO({
    required this.vehicleId,
    this.brandModelId,
    this.year,
    this.seatsTally,
    this.colorId,
    this.vehicleTypeId,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  // Factory method to create an instance of VehicleDTO from JSON
  factory VehicleDTO.fromJson(Map<String, dynamic> json) {
    return VehicleDTO(
      vehicleId: json['vehicleId'] as int,
      brandModelId: json['brandModelId'] as int?,
      year: json['year'] as int?,
      seatsTally: json['seatsTally'] as int?,
      colorId: json['colorId'] as int?,
      vehicleTypeId: json['vehicleTypeId'] as int?,
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

  // Method to convert an instance of VehicleDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'brandModelId': brandModelId,
      'year': year,
      'seatsTally': seatsTally,
      'colorId': colorId,
      'vehicleTypeId': vehicleTypeId,
      'createdAt': createdAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

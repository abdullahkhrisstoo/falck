class UpdateVehicleLicenseDTO {
  int vehicleLicenseId;
  int? vehicleId;
  String? frontImg;
  String? backImg;
  String? ownerName;
  String? plateNumber;
  DateTime? updatedAt;

  UpdateVehicleLicenseDTO({
    required this.vehicleLicenseId,
    this.vehicleId,
    this.frontImg,
    this.backImg,
    this.ownerName,
    this.plateNumber,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateVehicleLicenseDTO from JSON
  factory UpdateVehicleLicenseDTO.fromJson(Map<String, dynamic> json) {
    return UpdateVehicleLicenseDTO(
      vehicleLicenseId: json['vehicleLicenseId'] as int,
      vehicleId: json['vehicleId'] as int?,
      frontImg: json['frontImg'] as String?,
      backImg: json['backImg'] as String?,
      ownerName: json['ownerName'] as String?,
      plateNumber: json['plateNumber'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateVehicleLicenseDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleLicenseId': vehicleLicenseId,
      'vehicleId': vehicleId,
      'frontImg': frontImg,
      'backImg': backImg,
      'ownerName': ownerName,
      'plateNumber': plateNumber,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

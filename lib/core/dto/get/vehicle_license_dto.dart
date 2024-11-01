class VehicleLicenseDTO {
  int vehicleLicenseId;
  int? vehicleId;
  String? frontImg;
  String? backImg;
  String? ownerName;
  String? plateNumber;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;

  VehicleLicenseDTO({
    required this.vehicleLicenseId,
    this.vehicleId,
    this.frontImg,
    this.backImg,
    this.ownerName,
    this.plateNumber,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  // Factory method to create an instance of VehicleLicenseDTO from JSON
  factory VehicleLicenseDTO.fromJson(Map<String, dynamic> json) {
    return VehicleLicenseDTO(
      vehicleLicenseId: json['vehicleLicenseId'] as int,
      vehicleId: json['vehicleId'] as int?,
      frontImg: json['frontImg'] as String?,
      backImg: json['backImg'] as String?,
      ownerName: json['ownerName'] as String?,
      plateNumber: json['plateNumber'] as String?,
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

  // Method to convert an instance of VehicleLicenseDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleLicenseId': vehicleLicenseId,
      'vehicleId': vehicleId,
      'frontImg': frontImg,
      'backImg': backImg,
      'ownerName': ownerName,
      'plateNumber': plateNumber,
      'createdAt': createdAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

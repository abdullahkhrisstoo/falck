class DriverDTO {
  int driverId;
  int? vehicleId;
  int? userId;
  int? drivingLicenseId;
  int? personalIdentificationId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  DriverDTO({
    required this.driverId,
    this.vehicleId,
    this.userId,
    this.drivingLicenseId,
    this.personalIdentificationId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of DriverDTO from JSON
  factory DriverDTO.fromJson(Map<String, dynamic> json) {
    return DriverDTO(
      driverId: json['driverId'] as int,
      vehicleId: json['vehicleId'] as int?,
      userId: json['userId'] as int?,
      drivingLicenseId: json['drivingLicenseId'] as int?,
      personalIdentificationId: json['personalIdentificationId'] as int?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of DriverDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'driverId': driverId,
      'vehicleId': vehicleId,
      'userId': userId,
      'drivingLicenseId': drivingLicenseId,
      'personalIdentificationId': personalIdentificationId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

class UpdateDriverDTO {
  int driverId;
  int? vehicleId;
  int? userId;
  int? drivingLicenseId;
  int? personalIdentificationId;
  DateTime? updatedAt;

  UpdateDriverDTO({
    required this.driverId,
    this.vehicleId,
    this.userId,
    this.drivingLicenseId,
    this.personalIdentificationId,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateDriverDTO from JSON
  factory UpdateDriverDTO.fromJson(Map<String, dynamic> json) {
    return UpdateDriverDTO(
      driverId: json['driverId'] as int,
      vehicleId: json['vehicleId'] as int?,
      userId: json['userId'] as int?,
      drivingLicenseId: json['drivingLicenseId'] as int?,
      personalIdentificationId: json['personalIdentificationId'] as int?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateDriverDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'driverId': driverId,
      'vehicleId': vehicleId,
      'userId': userId,
      'drivingLicenseId': drivingLicenseId,
      'personalIdentificationId': personalIdentificationId,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class CreateDriverDTO {
  int? vehicleId;
  int? userId;
  int? drivingLicenseId;
  int? personalIdentificationId;

  CreateDriverDTO({
    this.vehicleId,
    this.userId,
    this.drivingLicenseId,
    this.personalIdentificationId,
  });

  // Factory method to create an instance of CreateDriverDTO from JSON
  factory CreateDriverDTO.fromJson(Map<String, dynamic> json) {
    return CreateDriverDTO(
      vehicleId: json['vehicleId'] as int?,
      userId: json['userId'] as int?,
      drivingLicenseId: json['drivingLicenseId'] as int?,
      personalIdentificationId: json['personalIdentificationId'] as int?,
    );
  }

  // Method to convert an instance of CreateDriverDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'userId': userId,
      'drivingLicenseId': drivingLicenseId,
      'personalIdentificationId': personalIdentificationId,
    };
  }
}

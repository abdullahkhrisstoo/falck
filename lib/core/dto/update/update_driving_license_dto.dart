class UpdateDrivingLicenseDTO {
  int drivingLicenseId;
  String? driverName;
  String? licenseNumber;
  String? frontImg;
  String? backImg;
  DateTime? updatedAt;

  UpdateDrivingLicenseDTO({
    required this.drivingLicenseId,
    this.driverName,
    this.licenseNumber,
    this.frontImg,
    this.backImg,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateDrivingLicenseDTO from JSON
  factory UpdateDrivingLicenseDTO.fromJson(Map<String, dynamic> json) {
    return UpdateDrivingLicenseDTO(
      drivingLicenseId: json['drivingLicenseId'] as int,
      driverName: json['driverName'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      frontImg: json['frontImg'] as String?,
      backImg: json['backImg'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateDrivingLicenseDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'drivingLicenseId': drivingLicenseId,
      'driverName': driverName,
      'licenseNumber': licenseNumber,
      'frontImg': frontImg,
      'backImg': backImg,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

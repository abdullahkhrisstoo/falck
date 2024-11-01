class DrivingLicenseDTO {
  int drivingLicenseId;
  String? driverName;
  String? licenseNumber;
  String? frontImg;
  String? backImg;
  DateTime? createdAt;
  DateTime? updatedAt;

  DrivingLicenseDTO({
    required this.drivingLicenseId,
    this.driverName,
    this.licenseNumber,
    this.frontImg,
    this.backImg,
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to create an instance of DrivingLicenseDTO from JSON
  factory DrivingLicenseDTO.fromJson(Map<String, dynamic> json) {
    return DrivingLicenseDTO(
      drivingLicenseId: json['drivingLicenseId'] as int,
      driverName: json['driverName'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      frontImg: json['frontImg'] as String?,
      backImg: json['backImg'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of DrivingLicenseDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'drivingLicenseId': drivingLicenseId,
      'driverName': driverName,
      'licenseNumber': licenseNumber,
      'frontImg': frontImg,
      'backImg': backImg,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

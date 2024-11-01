class CreateDrivingLicenseDTO {
  String? driverName;
  String? licenseNumber;
  String? frontImg;
  String? backImg;

  CreateDrivingLicenseDTO({
    this.driverName,
    this.licenseNumber,
    this.frontImg,
    this.backImg,
  });

  // Factory method to create an instance of CreateDrivingLicenseDTO from JSON
  factory CreateDrivingLicenseDTO.fromJson(Map<String, dynamic> json) {
    return CreateDrivingLicenseDTO(
      driverName: json['driverName'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      frontImg: json['frontImg'] as String?,
      backImg: json['backImg'] as String?,
    );
  }

  // Method to convert an instance of CreateDrivingLicenseDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'driverName': driverName,
      'licenseNumber': licenseNumber,
      'frontImg': frontImg,
      'backImg': backImg,
    };
  }
}

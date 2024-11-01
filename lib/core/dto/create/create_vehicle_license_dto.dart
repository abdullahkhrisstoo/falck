class CreateVehicleLicenseDTO {
  int? vehicleId;
  String? frontImg;
  String? backImg;
  String? ownerName;
  String? plateNumber;

  CreateVehicleLicenseDTO({
    this.vehicleId,
    this.frontImg,
    this.backImg,
    this.ownerName,
    this.plateNumber,
  });

  // Factory method to create an instance of CreateVehicleLicenseDTO from JSON
  factory CreateVehicleLicenseDTO.fromJson(Map<String, dynamic> json) {
    return CreateVehicleLicenseDTO(
      vehicleId: json['vehicleId'] as int?,
      frontImg: json['frontImg'] as String?,
      backImg: json['backImg'] as String?,
      ownerName: json['ownerName'] as String?,
      plateNumber: json['plateNumber'] as String?,
    );
  }

  // Method to convert an instance of CreateVehicleLicenseDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'frontImg': frontImg,
      'backImg': backImg,
      'ownerName': ownerName,
      'plateNumber': plateNumber,
    };
  }
}

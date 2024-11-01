class CreateVehicleImgDTO {
  String? pathImg;
  int? vehicleId;

  CreateVehicleImgDTO({
    this.pathImg,
    this.vehicleId,
  });

  // Factory method to create an instance of CreateVehicleImgDTO from JSON
  factory CreateVehicleImgDTO.fromJson(Map<String, dynamic> json) {
    return CreateVehicleImgDTO(
      pathImg: json['pathImg'] as String?,
      vehicleId: json['vehicleId'] as int?,
    );
  }

  // Method to convert an instance of CreateVehicleImgDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'pathImg': pathImg,
      'vehicleId': vehicleId,
    };
  }
}

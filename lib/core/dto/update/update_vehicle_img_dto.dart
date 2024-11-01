class UpdateVehicleImgDTO {
  int vehicleImgId;
  String? pathImg;
  int? vehicleId;
  DateTime? updatedAt;

  UpdateVehicleImgDTO({
    required this.vehicleImgId,
    this.pathImg,
    this.vehicleId,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateVehicleImgDTO from JSON
  factory UpdateVehicleImgDTO.fromJson(Map<String, dynamic> json) {
    return UpdateVehicleImgDTO(
      vehicleImgId: json['vehicleImgId'] as int,
      pathImg: json['pathImg'] as String?,
      vehicleId: json['vehicleId'] as int?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateVehicleImgDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleImgId': vehicleImgId,
      'pathImg': pathImg,
      'vehicleId': vehicleId,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

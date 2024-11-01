class VehicleImgDTO {
  int vehicleImgId;
  String? pathImg;
  int? vehicleId;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;

  VehicleImgDTO({
    required this.vehicleImgId,
    this.pathImg,
    this.vehicleId,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  // Factory method to create an instance of VehicleImgDTO from JSON
  factory VehicleImgDTO.fromJson(Map<String, dynamic> json) {
    return VehicleImgDTO(
      vehicleImgId: json['vehicleImgId'] as int,
      pathImg: json['pathImg'] as String?,
      vehicleId: json['vehicleId'] as int?,
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

  // Method to convert an instance of VehicleImgDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'vehicleImgId': vehicleImgId,
      'pathImg': pathImg,
      'vehicleId': vehicleId,
      'createdAt': createdAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

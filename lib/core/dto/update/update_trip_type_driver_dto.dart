class UpdateTripTypeDriverDTO {
  int tripTypeDriverId;
  int? tripTypeId;
  int? driverId;
  DateTime? updatedAt;

  UpdateTripTypeDriverDTO({
    required this.tripTypeDriverId,
    this.tripTypeId,
    this.driverId,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateTripTypeDriverDTO from JSON
  factory UpdateTripTypeDriverDTO.fromJson(Map<String, dynamic> json) {
    return UpdateTripTypeDriverDTO(
      tripTypeDriverId: json['tripTypeDriverId'] as int,
      tripTypeId: json['tripTypeId'] as int?,
      driverId: json['driverId'] as int?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateTripTypeDriverDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripTypeDriverId': tripTypeDriverId,
      'tripTypeId': tripTypeId,
      'driverId': driverId,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

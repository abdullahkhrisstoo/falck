class TripTypeDriverDTO {
  int tripTypeDriverId;
  int? tripTypeId;
  int? driverId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  TripTypeDriverDTO({
    required this.tripTypeDriverId,
    this.tripTypeId,
    this.driverId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of TripTypeDriverDTO from JSON
  factory TripTypeDriverDTO.fromJson(Map<String, dynamic> json) {
    return TripTypeDriverDTO(
      tripTypeDriverId: json['tripTypeDriverId'] as int,
      tripTypeId: json['tripTypeId'] as int?,
      driverId: json['driverId'] as int?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of TripTypeDriverDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripTypeDriverId': tripTypeDriverId,
      'tripTypeId': tripTypeId,
      'driverId': driverId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

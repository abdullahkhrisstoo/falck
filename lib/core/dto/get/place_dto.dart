class PlaceDTO {
  int placeId;
  int? userId;
  String? placeLat;
  String? placeLng;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  PlaceDTO({
    required this.placeId,
    this.userId,
    this.placeLat,
    this.placeLng,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of PlaceDTO from JSON
  factory PlaceDTO.fromJson(Map<String, dynamic> json) {
    return PlaceDTO(
      placeId: json['placeId'] as int,
      userId: json['userId'] as int?,
      placeLat: json['placeLat'] as String?,
      placeLng: json['placeLng'] as String?,
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

  // Method to convert an instance of PlaceDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'placeId': placeId,
      'userId': userId,
      'placeLat': placeLat,
      'placeLng': placeLng,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

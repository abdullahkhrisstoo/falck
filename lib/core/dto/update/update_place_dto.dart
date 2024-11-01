class UpdatePlaceDTO {
  int placeId;
  int? userId;
  String? placeLat;
  String? placeLng;
  DateTime? updatedAt;

  UpdatePlaceDTO({
    required this.placeId,
    this.userId,
    this.placeLat,
    this.placeLng,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdatePlaceDTO from JSON
  factory UpdatePlaceDTO.fromJson(Map<String, dynamic> json) {
    return UpdatePlaceDTO(
      placeId: json['placeId'] as int,
      userId: json['userId'] as int?,
      placeLat: json['placeLat'] as String?,
      placeLng: json['placeLng'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdatePlaceDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'placeId': placeId,
      'userId': userId,
      'placeLat': placeLat,
      'placeLng': placeLng,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

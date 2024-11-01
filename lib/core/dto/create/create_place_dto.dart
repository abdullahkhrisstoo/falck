class CreatePlaceDTO {
  int? userId;
  String? placeLat;
  String? placeLng;

  CreatePlaceDTO({
    this.userId,
    this.placeLat,
    this.placeLng,
  });

  // Factory method to create an instance of CreatePlaceDTO from JSON
  factory CreatePlaceDTO.fromJson(Map<String, dynamic> json) {
    return CreatePlaceDTO(
      userId: json['userId'] as int?,
      placeLat: json['placeLat'] as String?,
      placeLng: json['placeLng'] as String?,
    );
  }

  // Method to convert an instance of CreatePlaceDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'placeLat': placeLat,
      'placeLng': placeLng,
    };
  }
}

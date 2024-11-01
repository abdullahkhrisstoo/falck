class CreateTripStatusDTO {
  String? statusNameAr;
  String? statusNameEn;
  int? tripCategoryId;

  CreateTripStatusDTO({
    this.statusNameAr,
    this.statusNameEn,
    this.tripCategoryId,
  });

  // Factory method to create an instance of CreateTripStatusDTO from JSON
  factory CreateTripStatusDTO.fromJson(Map<String, dynamic> json) {
    return CreateTripStatusDTO(
      statusNameAr: json['statusNameAr'] as String?,
      statusNameEn: json['statusNameEn'] as String?,
      tripCategoryId: json['tripCategoryId'] as int?,
    );
  }

  // Method to convert an instance of CreateTripStatusDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'statusNameAr': statusNameAr,
      'statusNameEn': statusNameEn,
      'tripCategoryId': tripCategoryId,
    };
  }
}

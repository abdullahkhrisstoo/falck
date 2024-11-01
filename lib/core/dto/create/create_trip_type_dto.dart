class CreateTripTypeDTO {
  String? typeNameAr;
  String? typeNameEn;
  int? tripCategoryId;

  CreateTripTypeDTO({
    this.typeNameAr,
    this.typeNameEn,
    this.tripCategoryId,
  });

  // Factory method to create an instance of CreateTripTypeDTO from JSON
  factory CreateTripTypeDTO.fromJson(Map<String, dynamic> json) {
    return CreateTripTypeDTO(
      typeNameAr: json['typeNameAr'] as String?,
      typeNameEn: json['typeNameEn'] as String?,
      tripCategoryId: json['tripCategoryId'] as int?,
    );
  }

  // Method to convert an instance of CreateTripTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'typeNameAr': typeNameAr,
      'typeNameEn': typeNameEn,
      'tripCategoryId': tripCategoryId,
    };
  }
}

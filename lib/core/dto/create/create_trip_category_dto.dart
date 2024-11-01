class CreateTripCategoryDTO {
  String? categoryNameAr;
  String? categoryNameEn;

  CreateTripCategoryDTO({
    this.categoryNameAr,
    this.categoryNameEn,
  });

  // Factory method to create an instance of CreateTripCategoryDTO from JSON
  factory CreateTripCategoryDTO.fromJson(Map<String, dynamic> json) {
    return CreateTripCategoryDTO(
      categoryNameAr: json['categoryNameAr'] as String?,
      categoryNameEn: json['categoryNameEn'] as String?,
    );
  }

  // Method to convert an instance of CreateTripCategoryDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'categoryNameAr': categoryNameAr,
      'categoryNameEn': categoryNameEn,
    };
  }
}

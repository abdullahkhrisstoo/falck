class CreateUserTypeDTO {
  String? typeNameAr;
  String? typeNameEn;

  CreateUserTypeDTO({
    this.typeNameAr,
    this.typeNameEn,
  });

  // Factory method to create an instance of CreateUserTypeDTO from JSON
  factory CreateUserTypeDTO.fromJson(Map<String, dynamic> json) {
    return CreateUserTypeDTO(
      typeNameAr: json['typeNameAr'] as String?,
      typeNameEn: json['typeNameEn'] as String?,
    );
  }

  // Method to convert an instance of CreateUserTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'typeNameAr': typeNameAr,
      'typeNameEn': typeNameEn,
    };
  }
}

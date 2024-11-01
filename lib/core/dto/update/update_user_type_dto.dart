class UpdateUserTypeDTO {
  int userTypeId;
  String? typeNameAr;
  String? typeNameEn;
  DateTime? updatedAt;

  UpdateUserTypeDTO({
    required this.userTypeId,
    this.typeNameAr,
    this.typeNameEn,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateUserTypeDTO from JSON
  factory UpdateUserTypeDTO.fromJson(Map<String, dynamic> json) {
    return UpdateUserTypeDTO(
      userTypeId: json['userTypeId'] as int,
      typeNameAr: json['typeNameAr'] as String?,
      typeNameEn: json['typeNameEn'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateUserTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'userTypeId': userTypeId,
      'typeNameAr': typeNameAr,
      'typeNameEn': typeNameEn,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

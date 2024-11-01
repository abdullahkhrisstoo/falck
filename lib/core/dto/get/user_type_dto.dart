class UserTypeDTO {
  int userTypeId;
  String? typeNameAr;
  String? typeNameEn;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;

  UserTypeDTO({
    required this.userTypeId,
    this.typeNameAr,
    this.typeNameEn,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  // Factory method to create an instance of UserTypeDTO from JSON
  factory UserTypeDTO.fromJson(Map<String, dynamic> json) {
    return UserTypeDTO(
      userTypeId: json['userTypeId'] as int,
      typeNameAr: json['typeNameAr'] as String?,
      typeNameEn: json['typeNameEn'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UserTypeDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'userTypeId': userTypeId,
      'typeNameAr': typeNameAr,
      'typeNameEn': typeNameEn,
      'createdAt': createdAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class UserGenderDTO {
  int userGenderId;
  String? genderNameAr;
  String? genderNameEn;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;

  UserGenderDTO({
    required this.userGenderId,
    this.genderNameAr,
    this.genderNameEn,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  // Factory method to create an instance of UserGenderDTO from JSON
  factory UserGenderDTO.fromJson(Map<String, dynamic> json) {
    return UserGenderDTO(
      userGenderId: json['userGenderId'] as int,
      genderNameAr: json['genderNameAr'] as String?,
      genderNameEn: json['genderNameEn'] as String?,
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

  // Method to convert an instance of UserGenderDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'userGenderId': userGenderId,
      'genderNameAr': genderNameAr,
      'genderNameEn': genderNameEn,
      'createdAt': createdAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class UpdateUserGenderDTO {
  int userGenderId;
  String? genderNameAr;
  String? genderNameEn;
  DateTime? updatedAt;

  UpdateUserGenderDTO({
    required this.userGenderId,
    this.genderNameAr,
    this.genderNameEn,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateUserGenderDTO from JSON
  factory UpdateUserGenderDTO.fromJson(Map<String, dynamic> json) {
    return UpdateUserGenderDTO(
      userGenderId: json['userGenderId'] as int,
      genderNameAr: json['genderNameAr'] as String?,
      genderNameEn: json['genderNameEn'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateUserGenderDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'userGenderId': userGenderId,
      'genderNameAr': genderNameAr,
      'genderNameEn': genderNameEn,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class PersonalIdentificationDTO {
  int personalIdentificationId;
  String? personalName;
  String? personalNumber;
  String? frontImg;
  String? backImg;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  PersonalIdentificationDTO({
    required this.personalIdentificationId,
    this.personalName,
    this.personalNumber,
    this.frontImg,
    this.backImg,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of PersonalIdentificationDTO from JSON
  factory PersonalIdentificationDTO.fromJson(Map<String, dynamic> json) {
    return PersonalIdentificationDTO(
      personalIdentificationId: json['personalIdentificationId'] as int,
      personalName: json['personalName'] as String?,
      personalNumber: json['personalNumber'] as String?,
      frontImg: json['frontImg'] as String?,
      backImg: json['backImg'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of PersonalIdentificationDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'personalIdentificationId': personalIdentificationId,
      'personalName': personalName,
      'personalNumber': personalNumber,
      'frontImg': frontImg,
      'backImg': backImg,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

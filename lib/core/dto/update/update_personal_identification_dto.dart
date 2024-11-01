class UpdatePersonalIdentificationDTO {
  int personalIdentificationId;
  String? personalName;
  String? personalNumber;
  String? frontImg;
  String? backImg;
  DateTime? updatedAt;

  UpdatePersonalIdentificationDTO({
    required this.personalIdentificationId,
    this.personalName,
    this.personalNumber,
    this.frontImg,
    this.backImg,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdatePersonalIdentificationDTO from JSON
  factory UpdatePersonalIdentificationDTO.fromJson(Map<String, dynamic> json) {
    return UpdatePersonalIdentificationDTO(
      personalIdentificationId: json['personalIdentificationId'] as int,
      personalName: json['personalName'] as String?,
      personalNumber: json['personalNumber'] as String?,
      frontImg: json['frontImg'] as String?,
      backImg: json['backImg'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdatePersonalIdentificationDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'personalIdentificationId': personalIdentificationId,
      'personalName': personalName,
      'personalNumber': personalNumber,
      'frontImg': frontImg,
      'backImg': backImg,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

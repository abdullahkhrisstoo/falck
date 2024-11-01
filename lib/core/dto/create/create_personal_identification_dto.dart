class CreatePersonalIdentificationDTO {
  String? personalName;
  String? personalNumber;
  String? frontImg;
  String? backImg;

  CreatePersonalIdentificationDTO({
    this.personalName,
    this.personalNumber,
    this.frontImg,
    this.backImg,
  });

  // Factory method to create an instance of CreatePersonalIdentificationDTO from JSON
  factory CreatePersonalIdentificationDTO.fromJson(Map<String, dynamic> json) {
    return CreatePersonalIdentificationDTO(
      personalName: json['personalName'] as String?,
      personalNumber: json['personalNumber'] as String?,
      frontImg: json['frontImg'] as String?,
      backImg: json['backImg'] as String?,
    );
  }

  // Method to convert an instance of CreatePersonalIdentificationDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'personalName': personalName,
      'personalNumber': personalNumber,
      'frontImg': frontImg,
      'backImg': backImg,
    };
  }
}

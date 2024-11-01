class CreateBrandDTO {
  String? brandName;

  CreateBrandDTO({this.brandName});

  // Factory method to create an instance of CreateBrandDTO from JSON
  factory CreateBrandDTO.fromJson(Map<String, dynamic> json) {
    return CreateBrandDTO(
      brandName: json['brandName'] as String?,
    );
  }

  // Method to convert an instance of CreateBrandDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'brandName': brandName,
    };
  }
}

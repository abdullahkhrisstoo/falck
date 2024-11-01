class CreateModelDTO {
  int? brandId;
  String? modelName;

  CreateModelDTO({
    this.brandId,
    this.modelName,
  });

  // Factory method to create an instance of CreateModelDTO from JSON
  factory CreateModelDTO.fromJson(Map<String, dynamic> json) {
    return CreateModelDTO(
      brandId: json['brandId'] as int?,
      modelName: json['modelName'] as String?,
    );
  }

  // Method to convert an instance of CreateModelDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'modelName': modelName,
    };
  }
}

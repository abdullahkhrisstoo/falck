class UpdateModelDTO {
  int modelId;
  int? brandId;
  String? modelName;
  DateTime? updatedAt;

  UpdateModelDTO({
    required this.modelId,
    this.brandId,
    this.modelName,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateModelDTO from JSON
  factory UpdateModelDTO.fromJson(Map<String, dynamic> json) {
    return UpdateModelDTO(
      modelId: json['modelId'] as int,
      brandId: json['brandId'] as int?,
      modelName: json['modelName'] as String?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateModelDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'modelId': modelId,
      'brandId': brandId,
      'modelName': modelName,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

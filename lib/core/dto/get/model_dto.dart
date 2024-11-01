class ModelDTO {
  int modelId;
  int? brandId;
  String? modelName;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  ModelDTO({
    required this.modelId,
    this.brandId,
    this.modelName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of ModelDTO from JSON
  factory ModelDTO.fromJson(Map<String, dynamic> json) {
    return ModelDTO(
      modelId: json['modelId'] as int,
      brandId: json['brandId'] as int?,
      modelName: json['modelName'] as String?,
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

  // Method to convert an instance of ModelDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'modelId': modelId,
      'brandId': brandId,
      'modelName': modelName,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

class UpdateWalletDTO {
  int walletId;
  double? value;
  DateTime? updatedAt;

  UpdateWalletDTO({
    required this.walletId,
    this.value,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateWalletDTO from JSON
  factory UpdateWalletDTO.fromJson(Map<String, dynamic> json) {
    return UpdateWalletDTO(
      walletId: json['walletId'] as int,
      value: json['value'] != null ? (json['value'] as num).toDouble() : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateWalletDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'walletId': walletId,
      'value': value,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

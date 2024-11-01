class WalletDTO {
  int walletId;
  double? value;
  DateTime? createdAt;
  DateTime? deletedAt;
  DateTime? updatedAt;

  WalletDTO({
    required this.walletId,
    this.value,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
  });

  // Factory method to create an instance of WalletDTO from JSON
  factory WalletDTO.fromJson(Map<String, dynamic> json) {
    return WalletDTO(
      walletId: json['walletId'] as int,
      value: json['value']?.toDouble(),
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

  // Method to convert an instance of WalletDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'walletId': walletId,
      'value': value,
      'createdAt': createdAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

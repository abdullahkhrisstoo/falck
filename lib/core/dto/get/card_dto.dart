class CardDTO {
  int cardId;
  String? cardNumber;
  double? cardPrice;
  DateTime? createdDatetime;
  int? userId;
  bool? cardBeenUsed;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  CardDTO({
    required this.cardId,
    this.cardNumber,
    this.cardPrice,
    this.createdDatetime,
    this.userId,
    this.cardBeenUsed,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of CardDTO from JSON
  factory CardDTO.fromJson(Map<String, dynamic> json) {
    return CardDTO(
      cardId: json['cardId'] as int,
      cardNumber: json['cardNumber'] as String?,
      cardPrice: (json['cardPrice'] as num?)?.toDouble(),
      createdDatetime: json['createdDatetime'] != null ? DateTime.parse(json['createdDatetime']) : null,
      userId: json['userId'] as int?,
      cardBeenUsed: json['cardBeenUsed'] as bool?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      deletedAt: json['deletedAt'] != null ? DateTime.parse(json['deletedAt']) : null,
    );
  }

  // Method to convert an instance of CardDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'cardId': cardId,
      'cardNumber': cardNumber,
      'cardPrice': cardPrice,
      'createdDatetime': createdDatetime?.toIso8601String(),
      'userId': userId,
      'cardBeenUsed': cardBeenUsed,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

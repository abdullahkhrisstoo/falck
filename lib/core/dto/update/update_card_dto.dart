class UpdateCardDTO {
  int cardId;
  String? cardNumber;
  double? cardPrice;  // Dart does not have a `decimal` type, so we use `double`
  bool? carBeenUsed;
  DateTime? updatedAt;

  UpdateCardDTO({
    required this.cardId,
    this.cardNumber,
    this.cardPrice,
    this.carBeenUsed,
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateCardDTO from JSON
  factory UpdateCardDTO.fromJson(Map<String, dynamic> json) {
    return UpdateCardDTO(
      cardId: json['cardId'] as int,
      cardNumber: json['cardNumber'] as String?,
      cardPrice: json['cardPrice'] != null
          ? (json['cardPrice'] as num).toDouble()
          : null,
      carBeenUsed: json['carBeenUsed'] as bool?,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateCardDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'cardId': cardId,
      'cardNumber': cardNumber,
      'cardPrice': cardPrice,
      'carBeenUsed': carBeenUsed,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

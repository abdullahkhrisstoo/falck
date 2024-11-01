class CreateCardDTO {
  String? cardNumber;
  double? cardPrice;
  int? userId;
  bool? carBeenUsed;

  CreateCardDTO({
    this.cardNumber,
    this.cardPrice,
    this.userId,
    this.carBeenUsed,
  });

  // Factory method to create an instance of CreateCardDTO from JSON
  factory CreateCardDTO.fromJson(Map<String, dynamic> json) {
    return CreateCardDTO(
      cardNumber: json['cardNumber'] as String?,
      cardPrice: (json['cardPrice'] as num?)?.toDouble(),
      userId: json['userId'] as int?,
      carBeenUsed: json['carBeenUsed'] as bool?,
    );
  }

  // Method to convert an instance of CreateCardDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardPrice': cardPrice,
      'userId': userId,
      'carBeenUsed': carBeenUsed,
    };
  }
}

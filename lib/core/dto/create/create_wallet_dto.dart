class CreateWalletDTO {
  double? value;

  CreateWalletDTO({
    this.value,
  });

  // Factory method to create an instance of CreateWalletDTO from JSON
  factory CreateWalletDTO.fromJson(Map<String, dynamic> json) {
    return CreateWalletDTO(
      value: (json['value'] as num?)?.toDouble(),
    );
  }

  // Method to convert an instance of CreateWalletDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'value': value,
    };
  }
}

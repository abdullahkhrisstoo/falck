class CreateTripTypeDriverDTO {
  int? tripTypeId;
  int? driverId;

  CreateTripTypeDriverDTO({
    this.tripTypeId,
    this.driverId,
  });

  // Factory method to create an instance of CreateTripTypeDriverDTO from JSON
  factory CreateTripTypeDriverDTO.fromJson(Map<String, dynamic> json) {
    return CreateTripTypeDriverDTO(
      tripTypeId: json['tripTypeId'] as int?,
      driverId: json['driverId'] as int?,
    );
  }

  // Method to convert an instance of CreateTripTypeDriverDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripTypeId': tripTypeId,
      'driverId': driverId,
    };
  }
}

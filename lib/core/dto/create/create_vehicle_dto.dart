class CreateVehicleDTO {
  int? brandModelId;
  int? year;
  int? seatsTally;
  int? colorId;
  int? vehicleTypeId;

  CreateVehicleDTO({
    this.brandModelId,
    this.year,
    this.seatsTally,
    this.colorId,
    this.vehicleTypeId,
  });

  // Factory method to create an instance of CreateVehicleDTO from JSON
  factory CreateVehicleDTO.fromJson(Map<String, dynamic> json) {
    return CreateVehicleDTO(
      brandModelId: json['brandModelId'] as int?,
      year: json['year'] as int?,
      seatsTally: json['seatsTally'] as int?,
      colorId: json['colorId'] as int?,
      vehicleTypeId: json['vehicleTypeId'] as int?,
    );
  }

  // Method to convert an instance of CreateVehicleDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'brandModelId': brandModelId,
      'year': year,
      'seatsTally': seatsTally,
      'colorId': colorId,
      'vehicleTypeId': vehicleTypeId,
    };
  }
}

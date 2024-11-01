class CreateTripDTO {
  int? userId;
  int? driverId;
  int? tripTypeId;
  int? tripStatusId;
  int? discountId;
  int? parent;
  DateTime? createdDatetime;
  DateTime? departureDate; // Dart doesn't have a DateOnly type, so using DateTime
  String? departureTime; // Dart doesn't have a TimeOnly type, so using String
  String? fromLat;
  String? fromLng;
  String? toLat;
  String? toLng;
  int? seatsTally;
  double? price; // Using double for decimal values
  String? tripCode;
  DateTime? arriveDate; // Dart doesn't have a DateOnly type, so using DateTime
  String? arriveTime; // Dart doesn't have a TimeOnly type, so using String
  double? tripDistance; // Using double for decimal values

  CreateTripDTO({
    this.userId,
    this.driverId,
    this.tripTypeId,
    this.tripStatusId,
    this.discountId,
    this.parent,
    this.createdDatetime,
    this.departureDate,
    this.departureTime,
    this.fromLat,
    this.fromLng,
    this.toLat,
    this.toLng,
    this.seatsTally,
    this.price,
    this.tripCode,
    this.arriveDate,
    this.arriveTime,
    this.tripDistance,
  });

  // Factory method to create an instance of CreateTripDTO from JSON
  factory CreateTripDTO.fromJson(Map<String, dynamic> json) {
    return CreateTripDTO(
      userId: json['userId'] as int?,
      driverId: json['driverId'] as int?,
      tripTypeId: json['tripTypeId'] as int?,
      tripStatusId: json['tripStatusId'] as int?,
      discountId: json['discountId'] as int?,
      parent: json['parent'] as int?,
      createdDatetime: json['createdDatetime'] != null
          ? DateTime.parse(json['createdDatetime'] as String)
          : null,
      departureDate: json['departureDate'] != null
          ? DateTime.parse(json['departureDate'] as String)
          : null,
      departureTime: json['departureTime'] as String?,
      fromLat: json['fromLat'] as String?,
      fromLng: json['fromLng'] as String?,
      toLat: json['toLat'] as String?,
      toLng: json['toLng'] as String?,
      seatsTally: json['seatsTally'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      tripCode: json['tripCode'] as String?,
      arriveDate: json['arriveDate'] != null
          ? DateTime.parse(json['arriveDate'] as String)
          : null,
      arriveTime: json['arriveTime'] as String?,
      tripDistance: (json['tripDistance'] as num?)?.toDouble(),
    );
  }

  // Method to convert an instance of CreateTripDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'driverId': driverId,
      'tripTypeId': tripTypeId,
      'tripStatusId': tripStatusId,
      'discountId': discountId,
      'parent': parent,
      'createdDatetime': createdDatetime?.toIso8601String(),
      'departureDate': departureDate?.toIso8601String(),
      'departureTime': departureTime,
      'fromLat': fromLat,
      'fromLng': fromLng,
      'toLat': toLat,
      'toLng': toLng,
      'seatsTally': seatsTally,
      'price': price,
      'tripCode': tripCode,
      'arriveDate': arriveDate?.toIso8601String(),
      'arriveTime': arriveTime,
      'tripDistance': tripDistance,
    };
  }
}

import 'package:flutter/material.dart';

class UpdateTripDTO {
  int tripId;
  int? userId;
  int? driverId;
  int? tripTypeId;
  int? tripStatusId;
  int? discountId;
  int? parent;
  DateTime? createdDatetime;
  DateTime? departureDate;
  TimeOfDay? departureTime;
  String? fromLat;
  String? fromLng;
  String? toLat;
  String? toLng;
  int? seatsTally;
  double? price;
  String? tripCode;
  DateTime? arriveDate;
  TimeOfDay? arriveTime;
  double? tripDistance;
  DateTime? updatedAt;

  UpdateTripDTO({
    required this.tripId,
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
    this.updatedAt,
  });

  // Factory method to create an instance of UpdateTripDTO from JSON
  factory UpdateTripDTO.fromJson(Map<String, dynamic> json) {
    return UpdateTripDTO(
      tripId: json['tripId'] as int,
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
      departureTime: json['departureTime'] != null
          ? TimeOfDay.fromDateTime(DateTime.parse(json['departureTime'] as String))
          : null,
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
      arriveTime: json['arriveTime'] != null
          ? TimeOfDay.fromDateTime(DateTime.parse(json['arriveTime'] as String))
          : null,
      tripDistance: (json['tripDistance'] as num?)?.toDouble(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert an instance of UpdateTripDTO to JSON
  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'userId': userId,
      'driverId': driverId,
      'tripTypeId': tripTypeId,
      'tripStatusId': tripStatusId,
      'discountId': discountId,
      'parent': parent,
      'createdDatetime': createdDatetime?.toIso8601String(),
      'departureDate': departureDate?.toIso8601String(),
      'departureTime': departureTime != null
          ? departureTime!.toDateTime().toIso8601String()
          : null,
      'fromLat': fromLat,
      'fromLng': fromLng,
      'toLat': toLat,
      'toLng': toLng,
      'seatsTally': seatsTally,
      'price': price,
      'tripCode': tripCode,
      'arriveDate': arriveDate?.toIso8601String(),
      'arriveTime': arriveTime != null
          ? arriveTime!.toDateTime().toIso8601String()
          : null,
      'tripDistance': tripDistance,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

// Extension method to convert TimeOfDay to DateTime
extension TimeOfDayExtension on TimeOfDay {
  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}

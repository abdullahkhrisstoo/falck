import 'package:flutter/material.dart';

class TripDTO {
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
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  TripDTO({
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
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Factory method to create an instance of TripDTO from JSON
  factory TripDTO.fromJson(Map<String, dynamic> json) {
    return TripDTO(
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
          ? _parseTimeOfDay(json['departureTime'] as String)
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
          ? _parseTimeOfDay(json['arriveTime'] as String)
          : null,
      tripDistance: (json['tripDistance'] as num?)?.toDouble(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      deletedAt: json['deletedAt'] != null
          ? DateTime.parse(json['deletedAt'] as String)
          : null,
    );
  }

  // Helper method to parse TimeOfDay from a string
  static TimeOfDay _parseTimeOfDay(String timeString) {
    final parts = timeString.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  // Method to convert an instance of TripDTO to JSON
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
          ? '${departureTime!.hour}:${departureTime!.minute}'
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
          ? '${arriveTime!.hour}:${arriveTime!.minute}'
          : null,
      'tripDistance': tripDistance,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}

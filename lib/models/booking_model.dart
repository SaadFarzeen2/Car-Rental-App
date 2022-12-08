import 'package:traval/models/vehicle_model.dart';

class BookingModel {
  final int? id;
  final String? receiveLocation;
  final String? receiveDate;
  final String? pickupLocation;
  final String? pickupDate;
  final String? status;
  final VehicleDetailModel? vehicle;
  final bool? withDriver;

  BookingModel({
    this.id,
    this.receiveLocation,
    this.receiveDate,
    this.pickupLocation,
    this.pickupDate,
    this.status,
    this.vehicle,
    this.withDriver,
  });

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      id: map['id'],
      receiveLocation: map['receive_location'],
      receiveDate: map['receive_date'],
      pickupLocation: map["pickup_location"],
      pickupDate: map["pickup_date"],
      status: map['status'],
      vehicle: VehicleDetailModel.fromMap(map['vehicle']),
      withDriver: map['with_driver'] == 'yes',
    );
  }
}

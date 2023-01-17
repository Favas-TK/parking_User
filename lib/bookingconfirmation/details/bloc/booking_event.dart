part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class AddBookingEvent extends BookingEvent {
  AddBookingEvent({
    required this.vehicleNumber,
    required this.vehicleName,
    required this.vehicleType,
    required this.mobileNumber,
    required this.parkingTime,
   
  });
  String vehicleNumber;
  String vehicleName;
  String vehicleType;
  String mobileNumber;
  String parkingTime;
}

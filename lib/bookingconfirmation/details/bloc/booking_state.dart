part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingSucess extends BookingState {}

class BookingFailed extends BookingState {
   BookingFailed({required this.message});
  String message;
}

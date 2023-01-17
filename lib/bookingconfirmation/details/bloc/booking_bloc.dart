import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>((event, emit) async {
      if (event is AddBookingEvent) {
        try {
          final auth = FirebaseAuth.instance;
          final bookingAdd =
              FirebaseFirestore.instance.collection('Booking_Collection');

          final userId = auth.currentUser!.uid;

          const uuid = Uuid();
          final bookingId = uuid.v4();

          await bookingAdd.doc(bookingId).set({
            'Vehicle Number': event.vehicleNumber,
            'Area Name': event.vehicleName,
            'Vehicle Type': event.vehicleType,
            'Mobile Number': event.mobileNumber,
            'Parking Time': event.parkingTime,
            'user_id': userId,
          });
          emit(BookingSucess());
        } on FirebaseAuthException catch (e) {
          emit(BookingFailed(message: e.code));
        }
      }
    });
  }
}

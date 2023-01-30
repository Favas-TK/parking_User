import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_user/bookingconfirmation/details/bloc/booking_bloc.dart';
import 'package:parking_user/bookingconfirmation/view/vehicle%20details.dart';

class CreateBooking extends StatefulWidget {
  const CreateBooking({super.key});

  @override
  State<CreateBooking> createState() => _CreateBookingState();
}

List<String> list = <String>[
  'Car',
  'bike',
  'Truck',
  'Bus',
  'Van',
  'MotorCycle',
  'Auto Rickshow',
  'Bicycle',
  'Taxi'
];
String dropdownValue = list.first;

class _CreateBookingState extends State<CreateBooking> {
  final parkingAdd =
      FirebaseFirestore.instance.collection('Vehicle_Collection');

  final auth = FirebaseAuth.instance;

  final bookingDetails = BookingBloc();

  TextEditingController vehicleNumber = TextEditingController();

  TextEditingController vehicleName = TextEditingController();

  TextEditingController mobileNumber = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bookingDetails,
      child: BlocListener<BookingBloc, BookingState>(
        listener: (context, state) {
          if (state is BookingSucess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sucessfully added'),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => VehicleDetails (),
              ),
            );
          } else if (state is BookingFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Create Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: .050.sw,
                    ),
                  ),
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 235, 219, 174),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: vehicleNumber,
                        decoration: InputDecoration(
                          labelText: 'Enter your vehicle no',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-z]+$').hasMatch(value)) {
                            return 'Enter correct vehicle no';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: vehicleName,
                        decoration: InputDecoration(
                          labelText: 'Enter your Vehicle Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[A-z]+$').hasMatch(value)) {
                            return 'Enter correct vehicle no';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 62,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Choose vehicle',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 30,
                            ),
                            elevation: 16,
                            style: GoogleFonts.abhayaLibre(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue = value!;
                              });
                            },
                            items: list
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: mobileNumber,
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        // validator: Validators.noneEmptyValidator,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // SizedBox(
                    //   height: 40,
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.number,
                    //     controller: parkingTime,
                    //     decoration: InputDecoration(
                    //       labelText: 'Time needed for parking',
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(14),
                    //       ),
                    //     ),
                    //     validator: (value) {
                    //       if (value!.isEmpty ||
                    //           !RegExp(r'^[+]*[(]{0,1}[0-9]{1-4}[)]{0-1}[-\s\./0-9]+$')
                    //               .hasMatch(value)) {
                    //         return 'Invalid';
                    //       } else {
                    //         return null;
                    //       }
                    //     },
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: 50,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            highlightElevation: 0,
                            textColor: Colors.white,
                            color: const Color.fromARGB(255, 235, 219, 174),
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              bookingDetails.add(
                                AddBookingEvent(
                                  vehicleNumber: vehicleNumber.text,
                                  vehicleName: vehicleName.text,
                                  vehicleType: dropdownValue,
                                  mobileNumber: mobileNumber.text,
                                 // parkingTime: parkingTime.text,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

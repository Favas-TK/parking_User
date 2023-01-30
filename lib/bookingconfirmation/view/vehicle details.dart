import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_user/bookingconfirmation/details/bookin_details.dart';

import 'package:parking_user/bookingconfirmation/details/create_booking.dart';

class VehicleDetails extends StatefulWidget {
  VehicleDetails({super.key});

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

// List<String> list = [

// ];
// String dropdownValue = list.first;

class _VehicleDetailsState extends State<VehicleDetails> {
  final vehicleadd =
      FirebaseFirestore.instance.collection('Vehicle_Collection');

  final auth = FirebaseAuth.instance;

  bool _value = false;
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: EdgeInsets.only(left: 80),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'My Vehicles',
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
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: vehicleadd
                    .where('user_id', isEqualTo: auth.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  var data = snapshot.data!.docs;
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(data[index]['Vehicle_Type'].toString()),
                          subtitle: Text(data[index]['Vehicle_Name'].toString()),
                          leading: Radio(
                            value: index,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = value!;
                                print(value);
                                print(data[value]['Vehicle_Type'].toString());
                              });
                            },
                            activeColor: Colors.green,
                          ),
                        );
                        
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
               TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateBooking(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                )
          ],
        )

        // floatingActionButton: FloatingActionButton(

        // body: StreamBuilder<QuerySnapshot<Object?>>(
        //   stream: vehicleadd
        //       .where('user_id', isEqualTo: auth.currentUser!.uid)
        //       .snapshots(),
        //   builder: (
        //     BuildContext context,
        //     AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
        //   ) {
        //     if (snapshot.hasData) {
        //       final vehicles = snapshot.data!.docs;
        //       print(vehicles[0]['Vehicle_Type']);
        //       return Column(
        //         children: [
        //           SizedBox(
        //             height: 15,
        //           ),
        //           const Text(
        //             'Choose Your Vehicle',
        //             style: TextStyle(fontWeight: FontWeight.bold),
        //           ),
        //           Expanded(
        //             child: SizedBox(
        //                 height: 62,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     const Text(
        //                       'Choose vehicle',
        //                       style: TextStyle(
        //                         color: Colors.black,
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     // DropdownButton<String>(
        //                     //   value: vehicles[0]['Vehicle_Type'].toString(),
        //                     //   icon: const Icon(
        //                     //     Icons.arrow_drop_down_sharp,
        //                     //     size: 30,
        //                     //   ),
        //                     //   elevation: 16,
        //                     //   style: GoogleFonts.abhayaLibre(
        //                     //     fontSize: 21,
        //                     //     fontWeight: FontWeight.w400,
        //                     //     color: Colors.black,
        //                     //   ),
        //                     //   onChanged: (String? value) {
        //                     //     setState(() {
        //                     //       dropdownValue = value!;
        //                     //     });
        //                     //   },
        //                     //   items: vehicles
        //                     //       .map<DropdownMenuItem<String>>((QueryDocumentSnapshot<Object?> value) {
        //                     //         print(value);
        //                     //     return DropdownMenuItem<String>(
        //                     //       // value: value['Vehicle_Type'].toString(),
        //                     //       child: Text(value['Vehicle_Type'].toString()),
        //                     //     );
        //                     //   }).toList(),
        //                     // ),
        //                   ],
        //                 ),
        //               ),
        //           ),

        //         ],
        //       );
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
        );
  }
}

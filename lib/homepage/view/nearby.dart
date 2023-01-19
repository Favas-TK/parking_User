import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_user/bookingconfirmation/details/create_booking.dart';
import 'package:parking_user/bookingconfirmation/view/confirmation.dart';

class NearBy extends StatelessWidget {
  NearBy({super.key, required this.sortPlace});
  String sortPlace;
  final parkingSearch =
      FirebaseFirestore.instance.collection('Parking_Area_Collection');
  final auth = FirebaseAuth.instance;
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: parkingSearch
            .where('Location_Name', isEqualTo: sortPlace)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot,) {
          if (snapshot.hasData) {
            final parksort = snapshot.data!.docs;

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
                      Padding(
                        padding: EdgeInsets.only(left: 60.h),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Near Places',
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
              body: SingleChildScrollView(
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 330,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: parksort.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Confirmation(
                              parkingAxis: parksort[index],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          margin: const EdgeInsets.only(top: 18, bottom: 30),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            // Theme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: .01.sh,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  'assets/images/pngimg.com - parking_PNG91.png',
                                  height: 100,
                                  width: 200,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                parksort[index]['Area_Name'].toString(),
                                style: GoogleFonts.actor(fontSize: 17),
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 70,
                                    width: 15,
                                  ),
                                  const Icon(Icons.location_on_outlined),
                                  Text(
                                    parksort[index]['Location_Name'].toString(),
                                    style: GoogleFonts.andadaPro(),
                                  ),
                                ],
                              ),
                              const Text(
                                'Slots 50',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpotImage extends StatelessWidget {
  SpotImage({super.key});
  final parkingAdd =
      FirebaseFirestore.instance.collection('Parking_Area_Collection');
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 219, 174),
      body: StreamBuilder(
        stream: parkingAdd.snapshots(),
        // FirebaseFirestore.instance
        //     .collection('Parking_Area_Collection')
        //     .doc(auth.currentUser!.uid)
        //     .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Object>> snapshot) {
          if (snapshot.hasData) {
            final parkingdata = snapshot.data!;
         //   print(parkingdata['Spot_image'][1].toString());
            return Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 420.h,
                ),
                items: [
                  //  parkingdata['Spot_image'][0].toString(),
                  'https://th.bing.com/th/id/OIP.HhQwBlSw5S3JURg2BWGZZgHaLy?pid=ImgDet&rs=1',
                  'https://th.bing.com/th/id/OIP.HhQwBlSw5S3JURg2BWGZZgHaLy?pid=ImgDet&rs=1',
                  'https://th.bing.com/th/id/OIP.HhQwBlSw5S3JURg2BWGZZgHaLy?pid=ImgDet&rs=1',
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: 240.sh,
                        width: 300.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          children: [
                            Image.network(i
                             // parkingdata['Spot_image'][1].toString(),
                            ),
                            // Text('text $i', style: TextStyle(fontSize: 16.0),
                            // ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

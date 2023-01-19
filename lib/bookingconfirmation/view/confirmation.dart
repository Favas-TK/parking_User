import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_user/bookingconfirmation/view/date_time.dart';
import 'package:parking_user/bookingconfirmation/view/spotimage.dart';
import 'package:parking_user/bookingconfirmation/widgets/facilities.dart';

class Confirmation extends StatefulWidget {
  Confirmation({
    super.key,
    required this.parkingAxis,
  });
  QueryDocumentSnapshot<Object?> parkingAxis;

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  final parkingAdd =
      FirebaseFirestore.instance.collection('Parking_Area_Collection');

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final images = widget.parkingAxis['Spot_image'] as List;
    print(images);
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 30.h,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpotImage(),
                  ),
                );
              },
              icon: const Icon(
                FontAwesomeIcons.image,
                color: Colors.black,
                size: 15,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(),
                itemBuilder: (
                  BuildContext context,
                  int itemIndex,
                  int pageViewIndex,
                ) =>
                    Container(
                  height: 600,
                  width: 200,
                  child: Image.network(
                    widget.parkingAxis[itemIndex].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                widget.parkingAxis['Area_Name'].toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 18),
                  Text(
                    widget.parkingAxis['Location_Name'].toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              trailing: Text(
                widget.parkingAxis['Slots'].toString(),
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(right: 230.h),
              child: const Text(
                'Information',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50.h,
              width: 300.h,
              child: Text(
                widget.parkingAxis['Information'].toString(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 160.h),
              child: const Text(
                'Facilitities We Provide',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Facilities(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    highlightElevation: 0,
                    textColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        ),
                        Text(
                          'select Date & Time',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DateTimes(),
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
    );
  }
}

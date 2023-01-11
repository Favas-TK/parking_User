import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_user/bookingconfirmation/view/date_time.dart';
import 'package:parking_user/bookingconfirmation/widgets/facilities.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 30.h,
        leading: IconButton(
          onPressed: () {},
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
              onPressed: () {},
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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  'assets/images/map_detail.png',
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'HiLite Bussiness Park',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: const [
                  Icon(Icons.location_on_outlined, size: 18),
                  Text(
                    '24,Palazhi Road,Calicut',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              trailing: const Text('30 slots'),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(right: 230.h),
              child: const Text(
                'Information',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50.h,
              width: 300.h,
              child: const Text(
                'szdxfcgvhbjnkxdcfghbjhnklmnbcxdfghjknbvcsdfghjkdxfcghbhjkdxfgchvbjnkmnbvcxdfgh',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 160.h),
              child: const Text(
                'Facilitities We Provide',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                          builder: (context) => DateTimes(),
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

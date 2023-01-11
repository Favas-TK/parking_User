import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_user/mybooking/view/ongoing/extend_time.dart';
import 'package:parking_user/mybooking/widget/time_details.dart';

class Time extends StatelessWidget {
  const Time({super.key});

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
              Padding(
                padding: EdgeInsets.only(left: 50.w, bottom: .01.sh),
              ),
              Text(
                textAlign: TextAlign.center,
                'Parking Time',
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
          Card(
            color: const Color.fromARGB(255, 235, 219, 174),
            child: Container(
              height: 150.h,
              width: 200.w,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 15,
                    color: Color.fromARGB(255, 238, 236, 236),
                  )
                ],
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white54,
              ),
              child: Card(
                child: Container(
                  height: 80.h,
                  width: 100.h,
                  child: Center(
                    child: Text(
                      '16:09',
                      style: GoogleFonts.lakkiReddy(fontSize: 33),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          TimeDetails(
            item: 'Parking Area',
            data: 'Calicut',
          ),
          TimeDetails(data: 'Address', item: '24,PalazhiRoad,Calicut'),
          TimeDetails(data: 'Vehicle', item: 'Calicut(AFRD 666'),
          TimeDetails(data: 'Parking Details', item: 'Ground Floor(G06)'),
          TimeDetails(data: 'Date', item: 'January 18,2022'),
          TimeDetails(data: 'data', item: 'item'),
          SizedBox(
            height: 210.h,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 50,
              width: 320,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                highlightElevation: 0,
                textColor: Colors.white,
                color: const Color.fromARGB(255, 235, 219, 174),
                child: const Text(
                  'Extend Time',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExtendTime(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

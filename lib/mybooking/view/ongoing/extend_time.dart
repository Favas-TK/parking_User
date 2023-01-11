import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_user/mybooking/widget/mycard.dart';

class ExtendTime extends StatefulWidget {
  const ExtendTime({super.key});

  @override
  State<ExtendTime> createState() => _ExtendTimeState();
}

class _ExtendTimeState extends State<ExtendTime> {
  double _currentValue = 0;

  setEndPressed(double value) {
    setState(() {
      _currentValue = value;
    });
  }

  Widget buildFloatingButton(String text, VoidCallback callback) {
    const roundTextStyle = TextStyle(fontSize: 16, color: Colors.white);
    return FloatingActionButton(
      onPressed: callback,
      child: Text(text, style: roundTextStyle),
    );
  }

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
                'Extend Parking Time ',
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
          Padding(
            padding: const EdgeInsets.only(right: 100, top: 20),
            child: Text(
              'Add Time',
              style: GoogleFonts.radioCanada(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 80,
                child: Column(
                  children: [
                    FAProgressBar(
                      currentValue: _currentValue,
                      displayText: 'Hr',
                      progressGradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(0.75),
                          Colors.green.withOpacity(0.75),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: <Widget>[
                    buildFloatingButton('1', () => setEndPressed(1)),
                    buildFloatingButton('2', () => setEndPressed(20)),
                    buildFloatingButton('3', () => setEndPressed(80.5)),
                    buildFloatingButton('4', () => setEndPressed(90.25)),
                    buildFloatingButton('5', () => setEndPressed(100)),
                    buildFloatingButton('6', () => setEndPressed(140)),
                    buildFloatingButton('7', () => setEndPressed(90.25)),
                    buildFloatingButton('8', () => setEndPressed(100)),
                    buildFloatingButton('9', () => setEndPressed(140)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 5),
            child: Text(
              'Choose Payment Method',
              style: GoogleFonts.radioCanada(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MyCards(),
          SizedBox(
            height: 50.h,
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
                  'Confirm Pyment',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

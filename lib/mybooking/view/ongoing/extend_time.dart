import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtendTime extends StatefulWidget {
  const ExtendTime({super.key});

  @override
  State<ExtendTime> createState() => _ExtendTimeState();
}

class _ExtendTimeState extends State<ExtendTime> {
  int _count = 0;

  void _incrementcount() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 150, 115),
        title: const Text('Extend Parking Time'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 100, top: 20),
            child: Text(
              'Add Time',
              style: GoogleFonts.radioCanada(
                  fontSize: 16.sp, fontWeight: FontWeight.w500,),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 60.h,
            width: 120.w,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  blurRadius: 7, color: Color.fromARGB(153, 138, 138, 138),)
            ], borderRadius: BorderRadius.circular(10.r), color: Colors.white,),
            child: Row(
              children: [
                SizedBox(
                  height: 30.h,
                  width: 38.w,
                  child: OutlinedButton(
                      onPressed: _decrement, child: const Text('-'),),
                ),
                Text('$_count'),
                SizedBox(
                  height: 30.h,
                  width: 38.w,
                  child: OutlinedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 76, 150, 115),),),
                      onPressed: _incrementcount,
                      child: const Text('+'),),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 5),
            child: Text(
              'Choose Payment Method',
              style: GoogleFonts.radioCanada(
                  fontSize: 16.sp, fontWeight: FontWeight.w500,),
            ),
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 76, 150, 115),),),
              onPressed: () {},
              child: const Text('Razoo Pay'),)
        ],
      ),
    );
  }
}

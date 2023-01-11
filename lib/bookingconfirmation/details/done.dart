import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
           // margin: EdgeInsets.only(bottom: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(39.r),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [Image.asset('assets/images/check_img.png')],
            ),
          ),
        ),
      ),
    );
  }
}

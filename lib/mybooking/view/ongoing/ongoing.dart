import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parking_user/mybooking/view/ongoing/extend_time.dart';

import 'package:parking_user/mybooking/view/ongoing/time.dart';

class OnGoing extends StatelessWidget {
  const OnGoing({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 200.h,
          width: 350.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14, top: 10, right: 18),
                    child: Container(
                      height: 102.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.r),
                        boxShadow: const [
                          BoxShadow(blurRadius: 7, color: Colors.white24)
                        ],
                        color: Colors.white,
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://img.staticmb.com/mbcontent//images/uploads/2022/9/should-you-pay-extra-for-parking-spaces.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 13.h,
                      ),
                      const Text(
                        'Booking ID:P0346571655',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'HiLite Bussiness Park',
                      ),
                      Row(
                        children: const [
                          Icon(Icons.location_on_outlined, size: 18),
                          Text(
                            '24,Palazhi Road,Calicut',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 235, 219, 174),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'HiLite Bussiness Park',
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(right: 123),
                child: Text(
                  'Time Remaining :02:12:10',
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    highlightElevation: 0,
                    color: const Color.fromARGB(255, 235, 219, 174),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Time(),
                          ));
                    },
                    child: const Text(
                      'View Time',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    highlightElevation: 0,
                    color: const Color.fromARGB(255, 235, 219, 174),
                    onPressed: () {},
                    child: const Text(
                      'View Ticket',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

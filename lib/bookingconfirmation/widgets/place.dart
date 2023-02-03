import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_user/bookingconfirmation/details/details.dart';
import 'package:parking_user/bookingconfirmation/details/devider.dart';

class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Details(
            name: 'Booking ID:',
            details: 'P021467384',
            name2: 'Parking Slot:',
            details2: 'Ground Floor',
          ),
          Details(
            name: 'reserverd Date:',
            details: 'January,18,2023',
            name2: 'Time:',
            details2: '6:30 PM',
          ),
          Details(
            name: 'Vehicle Details:',
            details: 'Toyota(AFD 6397)',
            name2: 'Vehicle Type:',
            details2: 'Luxury seden',
          ),
          Container(
            margin: const EdgeInsets.only(left: 80),
            child: CustomPaint(
              painter: DrawDottedhorizontalline(),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 110.h,
            width: 309.w,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Cost',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Parking hours(1hr)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(r'$10')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Tax',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(r'$3')
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(r'$13')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

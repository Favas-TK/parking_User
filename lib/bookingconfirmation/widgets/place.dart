import 'package:flutter/material.dart';
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
          margin: EdgeInsets.only(left: 80),
          
          child: CustomPaint(painter: DrawDottedhorizontalline(),
          
          ),),
           Details(
            name: 'Vehicle Details:',
            details: 'Toyota(AFD 6397)',
            name2: 'Vehicle Type:',
            details2: 'Luxury seden',
          ),
        ],
      ),
    );
  }
}

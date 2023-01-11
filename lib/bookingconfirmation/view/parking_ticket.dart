import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_user/bookingconfirmation/widgets/parking_detail_ticket.dart';

class ParkingTicket extends StatelessWidget {
  const ParkingTicket({super.key});

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
              const Padding(
                padding: EdgeInsets.only(left: 40),
              ),
              Text(
                textAlign: TextAlign.center,
                'Parking Ticket',
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
          ParkingdetailTicket(),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 300.h,
              height: 50.h,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                highlightElevation: 0,
                textColor: Colors.white,
                color: const Color.fromARGB(255, 235, 219, 174),
                child: Text(
                  'Get Direction',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: .040.sw,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ParkingTicket(),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: 300.h,
              height: 50.h,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25),
                ),
                textColor: Colors.white,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: .040.sw,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

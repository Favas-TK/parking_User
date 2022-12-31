import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_user/dashboard/dashboard.dart';
import 'package:parking_user/mybooking/view/canceled.dart';
import 'package:parking_user/mybooking/view/history.dart';
import 'package:parking_user/mybooking/view/ongoing/ongoing.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  List<String> item = ['Ongoing', 'History', 'Cancelled'];
  List<Widget> data = [OnGoing(), History(), CancelPark()];

  int currentIndex = 0;

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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 80),
              ),
              Text(
                textAlign: TextAlign.center,
                'My Booking',
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
      body: Container(
        margin: const EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
              width: double.infinity.w,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: item.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Visibility(
                        visible: false,
                        child: Container(
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          height: 40.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? const Color.fromARGB(255, 235, 219, 174)
                                : Colors.white,
                            borderRadius: currentIndex == index
                                ? BorderRadius.circular(17)
                                : BorderRadius.circular(17),
                            border: currentIndex == index
                                ? null
                                : Border.all(
                                    color: Color.fromRGBO(164, 163, 163, 1),
                                    width: 2.w,
                                  ),
                          ),
                          child: Center(
                            child: Text(
                              item[index],
                              style: GoogleFonts.abel(
                                color: currentIndex == index
                                    ? const Color.fromARGB(179, 205, 23, 10)
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            (data[currentIndex])
          ],
        ),
      ),
    );
  }
}


















// body: Container(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Column(
      //         children: [
      //           ButtonBar(
      //             alignment: MainAxisAlignment.center,
      //             buttonPadding:
      //                 const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //             children: [
      //               MaterialButton(
      //                 shape: RoundedRectangleBorder(
      //                   side: const BorderSide(),
      //                   borderRadius: BorderRadius.circular(25),
      //                 ),
      //                 // textColor: Colors.white,
      //                 color: btn1
      //                     ? const Color.fromARGB(255, 235, 219, 174)
      //                     : Colors.white,
      //                 onPressed: () {
      //                   setState(() {
      //                     btn1 = true;
      //                     btn2 = false;
      //                     btn3 = false;
      //                   });
      //                 },
      //                 child: const Text('Ongoing'),
      //               ),
      //               MaterialButton(
      //                 shape: RoundedRectangleBorder(
      //                   side: const BorderSide(),
      //                   borderRadius: BorderRadius.circular(25),
      //                 ),
      //                 // textColor: Colors.white,
      //                 color: btn2
      //                     ? const Color.fromARGB(255, 235, 219, 174)
      //                     : Colors.white,
      //                 onPressed: () {
      //                   setState(() {
      //                     btn1 = false;
      //                     btn2 = true;
      //                     btn3 = false;
      //                   });
      //                 },

      //                 child: const Text('History'),
      //               ),
      //               MaterialButton(
      //                 shape: RoundedRectangleBorder(
      //                   side: const BorderSide(),
      //                   borderRadius: BorderRadius.circular(25),
      //                 ),

      //                 color: btn3
      //                     ? const Color.fromARGB(255, 235, 219, 174)
      //                     : Colors.white,

      //                 onPressed: () {
      //                   setState(() {
      //                     btn1 = false;
      //                     btn2 = false;
      //                     btn3 = true;
      //                   });
      //                 },
      //                 child: const Text('Canceled'),
      //               ),
      //             ],
      //           ),

      //           // Card(
      //           //   child: Row(
      //           //     children: [
      //           //       CircleAvatar(radius: 60,),
      //           //       Column(
      //           //         children: [
      //           //           Text('data'),
      //           //            Text('data'),
      //           //       Text('data'),
      //           //         ],
      //           //       ),

      //           //     ],
      //           //   ),
      //           // ),
      //           Card(
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.end,
      //               children: [
      //                 const CircleAvatar(
      //                   radius: 60,
      //                 ),
      //                 Column(
      //                   children: [
      //                     const Text('data'),
      //                     const Text('data'),
      //                     const Text('data'),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
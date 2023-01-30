import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_user/bookingconfirmation/view/parking_ticket.dart';
import 'package:parking_user/bookingconfirmation/view/payment.dart';
import 'package:parking_user/bookingconfirmation/widgets/card_widget.dart';
import 'package:parking_user/bookingconfirmation/widgets/place.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({
    super.key,
  });

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  late Razorpay _razorpay;
  @override
  void initState() {
  _razorpay = Razorpay();
    super.initState();
  }
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
                'booking Confirmation',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 200.h),
              child: Text(
                'Parking Name',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: .040.sw,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    // height: 200.h,
                    // width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 13.h,
                                ),
                                Text(
                                  'HiLite Bussiness Park',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: .050.sw,
                                  ),
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
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/images/Logo.svg',
                              height: .1.sw,
                              matchTextDirection: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Places(),
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: SizedBox(
            //     width: 300.h,
            //     height: 50.h,
            //     child: MaterialButton(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //       highlightElevation: 0,
            //       textColor: Colors.white,
            //       color: const Color.fromARGB(255, 235, 219, 174),
            //       child: const Text(
            //         'Confirm Payment',
            //         style: TextStyle(color: Colors.black),
            //       ),
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => Paymentt(),
            //           ),
            //         );

                    // showModalBottomSheet(
                    //   backgroundColor: Colors.transparent,
                    //   context: context,
                    //   builder: (context) {
                    //     return Padding(
                    //       padding: const EdgeInsets.all(20),
                    //       child: Container(
                    //         margin: EdgeInsets.only(bottom: 10),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(39.r),
                    //           ),
                    //           color: Colors.white,
                    //         ),
                    //         child: Column(
                    //           children: [
                    //             Image.asset(
                    //               'assets/images/check_img.png',
                    //               width: 150,
                    //             ),
                    //             Text(
                    //               'Successful',
                    //               style: TextStyle(
                    //                 color: Colors.black,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: .050.sw,
                    //               ),
                    //             ),
                    //             Text(
                    //                 'Success fully made Payment for your parking'),
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //             Container(
                    //               padding:
                    //                   const EdgeInsets.symmetric(horizontal: 20),
                    //               child: SizedBox(
                    //                 width: 300.h,
                    //                 height: 50.h,
                    //                 child: MaterialButton(
                    //                   shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(25),
                    //                   ),
                    //                   highlightElevation: 0,
                    //                   textColor: Colors.white,
                    //                   color: const Color.fromARGB(
                    //                       255, 235, 219, 174),
                    //                   child: Text(
                    //                     'View Parking Ticket',
                    //                     style: TextStyle(
                    //                       color: Colors.black,
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: .040.sw,
                    //                     ),
                    //                   ),
                    //                   onPressed: () {
                    //                     Navigator.pushReplacement(
                    //                       context,
                    //                       MaterialPageRoute(
                    //                         builder: (context) => ParkingTicket(),
                    //                       ),
                    //                     );
                    //                   },
                    //                 ),
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //             Container(
                    //               padding:
                    //                   const EdgeInsets.symmetric(horizontal: 20),
                    //               child: SizedBox(
                    //                 width: 300.h,
                    //                 height: 50.h,
                    //                 child: MaterialButton(
                    //                   shape: RoundedRectangleBorder(
                    //                     side:
                    //                         const BorderSide(color: Colors.black),
                    //                     borderRadius: BorderRadius.circular(25),
                    //                   ),
                    //                   textColor: Colors.white,
                    //                   child: Text(
                    //                     'Cancel',
                    //                     style: TextStyle(
                    //                       color: Colors.black,
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: .040.sw,
                    //                     ),
                    //                   ),
                    //                   onPressed: () {
                    //                     Navigator.pop(context);
                    //                   },
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // );
            //       },
            //     ),
            //   ),
            // ),
            Paymentt(),
          ],
        ),
      ),
    );
  }
}

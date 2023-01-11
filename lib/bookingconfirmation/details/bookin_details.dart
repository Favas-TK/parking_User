import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_user/bookingconfirmation/details/place.dart';
import 'package:parking_user/bookingconfirmation/widgets/card_widget.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({super.key});

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
      body: Column(
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
          Card_Widget(
            name: 'Paypal',
            data: 'xxxx xxxx xxxx 2354',
            icn: FontAwesomeIcons.paypal,
            clr: Colors.blue,
          ),
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
                child: const Text(
                  'Confirm Payment',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                               Radius.circular(39.r),
                             
                            ),
                            color: Colors.white,
                          ),
                          //  height: MediaQuery.of(context).size.height,
                          // width: 452.w,
                          // child: Padding(
                          //   padding: MediaQuery.of(context).viewInsets,
                          //   child: Column(
                          //     children: [
                          //       SizedBox(
                          //         height: 10,
                          //       ),
                          //       // Divider(thickness: 5,color: Color.fromARGB(127, 0, 0, 0),),
                          //     ],
                          //   ),
                          // ),
                        ),
                      );
                    },
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

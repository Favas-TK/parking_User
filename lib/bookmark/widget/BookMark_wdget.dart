import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookMarkWidget extends StatelessWidget {
  const BookMarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 340.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 13, top: 11, right: 15),
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
                          const Text(
                            'Booking ID:P0346571655',
                          ),
                          const Text(
                            'HiLite Bussiness Park',
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                size: 18,
                              ),
                              Text(
                                '24,Palazhi Road,Calicut',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 250.w),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark,
                        color: Color.fromARGB(255, 235, 219, 174),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

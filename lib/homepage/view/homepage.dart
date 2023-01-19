import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_user/homepage/view/nearby.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Current Location',
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 106, 106),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(Icons.location_on),
                            Text('hiliteMall , Calicut'),
                          ],
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.HhQwBlSw5S3JURg2BWGZZgHaLy?pid=ImgDet&rs=1',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: searchcontroller,
                      cursorHeight: 25,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: 'Where do..?',
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NearBy(
                              sortPlace: searchcontroller.text,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Near By',
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 250.w),
                //   child: TextButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => VehicleChange(),
                //         ),
                //       );
                //     },
                //     child: const Text(
                //       'see all',
                //       style: TextStyle(
                //         color: Colors.black,
                //         decoration: TextDecoration.underline,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                // VehicleType(),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      'assets/images/map_detail.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_user/homepage/widget/vehicles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(Icons.location_on),
                          const Text('hiliteMall , Calicut'),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 40.h,
                    backgroundColor: Colors.white,
                    child: const Text('F'),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextField(
                    cursorHeight: 25,
                    decoration: InputDecoration(
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
              Padding(
                padding: EdgeInsets.only(left: 300.w),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'see all',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              VehicleType(),
              Card(
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Near By',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

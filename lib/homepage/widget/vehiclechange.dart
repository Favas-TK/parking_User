import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VehicleChange extends StatelessWidget {
  VehicleChange({super.key});
  final category = [
    {
      'category': 'Car',
      'image': 'assets/images/img1.png',
    },
    {
      'category': 'Bus',
      'image': 'assets/images/img2.png',
    },
    {
      'category': 'Truck',
      'image': 'assets/images/img3.png',
    },
    {
      'category': 'Van',
      'image': 'assets/images/img4.png',
    },
    {
      'category': 'MotorCycle',
      'image': 'assets/images/img5.png',
    },
    {
      'category': 'Scooter',
      'image': 'assets/images/img6.png',
    },
    {
      'category': 'Auto Rickshow',
      'image': 'assets/images/img7.png',
    },
    {
      'category': 'Bicycle',
      'image': 'assets/images/img8.png',
    },
    {
      'category': 'Taxi',
      'image': 'assets/images/img9.png',
    },
  ];

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
               Padding(
                padding: EdgeInsets.only(left: 50.w,bottom: .01.sh),
              ),
              Text(
                textAlign: TextAlign.center,
                'Choose Your Vehicle',
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
      body: ListView.builder(
        shrinkWrap: true,
        //  scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Card(
              child: ListTile(
                leading: ClipOval(
                  child: Image.asset(
                    category[index]['image'].toString(),
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  category[index]['category'].toString(),
                ),
              ),
            ),
          );
        },
        itemCount: category.length,
      ),
    );
  }
}

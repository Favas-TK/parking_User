import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_user/profile/view/widget/vehicle.dart';

class MyVehicle extends StatefulWidget {
  const MyVehicle({super.key});

  @override
  State<MyVehicle> createState() => _MyVehicleState();
}

class _MyVehicleState extends State<MyVehicle> {
  String selected = 'First';
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
                padding: EdgeInsets.only(left: 80),
              ),
              Text(
                textAlign: TextAlign.center,
                'My Vehicles',
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
      body: Card(
        child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'First';
                  });
                },
                child: Vehicle(
                  vcl_name: 'Toyota Labnd cruiser',
                  vcl_no: 'KL18 3496',
                  clr: selected == 'First' ? Colors.black : Colors.transparent,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'Second';
                  });
                },
                child: Vehicle(
                  vcl_name: 'Maruthi Suzuki Alto',
                  vcl_no: 'KL18 5467',
                  clr: selected == 'Second' ? Colors.black : Colors.transparent,
                ),
              ),
             
             
            ],
          ),
      ),
    );
  }
}

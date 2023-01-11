import 'package:flutter/material.dart';

class VehicleType extends StatelessWidget {
  VehicleType({super.key});
  final category = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
    'assets/images/img8.png',
    'assets/images/img9.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Card(
                  child: ClipOval(
                    child: Image.asset(
                      category[index],
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: category.length,
      ),
    );
  }
}

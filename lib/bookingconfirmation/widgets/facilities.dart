import 'package:flutter/material.dart';

class Facilities extends StatelessWidget {
  Facilities({super.key});
  final category = [
    {
      'category': 'cctv',
      'image': 'assets/images/—Pngtree—cctv and camera symbol_5279780.png'
    },
    {
      'category': '24*7',
      'image':
          'assets/images/pngtree-24-hour-delivery-service-png-png-image_6954332.png'
    },
    {
      'category': 'Pickup',
      'image': 'assets/images/pngtree-car-parking-sign-png-image_8796312.png'
    },
    {
      'category': 'Car Wash',
      'image':
          'assets/images/pngtree-cartoon-hand-drawn-car-wash-scene-illustration-png-image_5044882.jpg'
    },
    {
      'category': 'Payment',
      'image': 'assets/images/pngtree-mobile-payment-png-image_8485675.png'
    },
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
                ClipOval(
                  child: Image.asset(
                    category[index].values.last,
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Text(
                    category[index].values.first,
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

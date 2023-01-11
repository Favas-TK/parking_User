import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmCards extends StatelessWidget {
  ConfirmCards({super.key});
  final category = [
    {
      'category': 'Paypal',
      'image': 'assets/icons/paypal.svg',
    },
    {
      'category': 'Master Card',
      'image': 'assets/icons/mastercard.svg',
    },
    {
      'category': 'Visa',
      'image': 'assets/icons/visa.svg',
    },
    {
      'category': 'Cash',
      'image': 'assets/icons/cash.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      //  scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: ClipOval(
              child: SvgPicture.asset(
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
        );
      },
      itemCount: category.length,
    );
  }
}

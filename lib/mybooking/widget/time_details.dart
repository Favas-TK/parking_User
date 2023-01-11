import 'package:flutter/material.dart';

class TimeDetails extends StatelessWidget {
  TimeDetails({super.key, required this.data, required this.item});
  String item;
  String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 10),
          child: Text(
            item,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 10),
          child: Text(
            data,
          ),
        )
      ],
    );
  }
}

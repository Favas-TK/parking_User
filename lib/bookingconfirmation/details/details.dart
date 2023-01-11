import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({
    super.key,
    required this.name,
    required this.details2,
    required this.details,
    required this.name2,
  });
  String name;
  String details;
  String name2;
  String details2;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(color: Colors.grey),
      ),
      subtitle: Text(
        details,
        style: const TextStyle(color: Colors.black),
      ),
      trailing: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              name2,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Text(details2),
        ],
      ),
    );
  }
}

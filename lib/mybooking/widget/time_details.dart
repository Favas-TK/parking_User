import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeDetails extends StatelessWidget {
  TimeDetails({super.key, required this.data, required this.item});
  String item;
  String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Text(
              item,
              style: GoogleFonts.laila(color: Color.fromARGB(255, 70, 69, 69)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10),
            child: Text(
              data,
              style: GoogleFonts.laila(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}

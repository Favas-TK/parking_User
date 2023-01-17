import 'package:flutter/material.dart';

class DropdownBtn extends StatefulWidget {
  DropdownBtn({super.key, required this.items, required this.text});
  List items;
  final String text;

  @override
  State<DropdownBtn> createState() => _BookingsState();
}

class _BookingsState extends State<DropdownBtn> {
  String? _dropDownValue;
  // ignore: strict_raw_type
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 141, 140, 140),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(widget.text),
          isExpanded: true,
          iconSize: 30,
          value: _dropDownValue,
          style: const TextStyle(color: Colors.black),
          items: widget.items.map((items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items.toString()),
            );
          }).toList(),
          onChanged: (val) {
            setState(
              () {
                _dropDownValue = val.toString();
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:parking_user/mybooking/widget/history_widget.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return HistoryWidget();
        },
      ),
    );
  }
}

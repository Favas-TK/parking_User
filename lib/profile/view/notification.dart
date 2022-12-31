import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parking_user/profile/view/widget/notification_widget.dart';



class Notificationn extends StatelessWidget {
  const Notificationn({super.key});

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
                'Notification',
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
       body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Today'),
          ),
          Notifictn_wdgt(
            name: 'Payment Successful!',
            data: 'Parking booking at portaly was succes',
            icn: FontAwesomeIcons.circleCheck,
            clr: Colors.green,
          ),
          Notifictn_wdgt(
            name: 'Payment Failed!',
            data: 'You have canced parking',
            icn: FontAwesomeIcons.circleXmark,
            clr: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Yesterday'),
          ),
          Notifictn_wdgt(
            name: 'Payment Successful!',
            data: 'Parking booking at portaly was succes',
            icn: FontAwesomeIcons.circleCheck,
            clr: Colors.green,
          ),
        ],
      ),
    );
  }
}

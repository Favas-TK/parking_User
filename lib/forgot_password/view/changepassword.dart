import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_user/forgot_password/view/changenotification.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 235, 219, 174),
                  offset: Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(150),
              ),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            child: Column(
              children:  [
                SvgPicture.asset('assets/images/Logo.svg',height: .3.sw, 
                  matchTextDirection: true,),
                 Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: .1.sw,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2),
                ),
              ),
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              highlightElevation: 0,
              textColor: Colors.white,
              color: const Color.fromARGB(255, 235, 219, 174),
              child: const Text(
                'Create Password',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotifyPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

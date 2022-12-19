import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_user/forgot_password/view/changepassword.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

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
              children: [
                SvgPicture.asset(
                  'assets/images/Logo.svg',
                  height: .3.sw,
                  matchTextDirection: true,
                ),
                Text(
                  'Verification',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: .1.sw,
                  ),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Text(
                  'we texted you a code ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'please enter it below',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(15)),
          Column(
            children: [
              OtpTextField(
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),

                showFieldAsBox: true,

                onCodeChanged: (String code) {},

                onSubmit: (String verificationCode) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Verification Code'),
                        content: Text('Code entered is $verificationCode'),
                      );
                    },
                  );
                }, // end onSubmit
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont recieve code ?'),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ],
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
                'Done',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePassword(),
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

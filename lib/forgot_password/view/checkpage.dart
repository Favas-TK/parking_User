import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_user/forgot_password/view/verification.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Center(
              child:SvgPicture.asset(
              'assets/images/mail.svg',
              height: .3.sw,
              matchTextDirection: true,
            ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'Check your Mail',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.8),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'We have sent a password recovey',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(' instruction to you email'),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25),
                ),
                highlightElevation: 0,
                textColor: Colors.white,
                //  color: Colors.black,
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Verification(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

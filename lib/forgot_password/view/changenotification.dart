import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking_user/login/view/login.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/done.svg',
              height: .3.sw,
              matchTextDirection: true,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'Password Changed',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.8),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'Enter your Registered mail to create new',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(' Password'),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(),
                  borderRadius: BorderRadius.circular(25),
                ),
                highlightElevation: 0,
                textColor: Colors.white,
                //  color: Colors.black,
                child: const Text(
                  'Go to Login',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute <dynamic>(
                  //     builder: (context) => const Login(),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

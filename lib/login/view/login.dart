import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parking_user/dashboard/view/dashboard.dart';

import 'package:parking_user/forgot_password/view/forgot_password.dart';
import 'package:parking_user/signup/view/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obsecuretext = true;
  void _toggle() {
    setState(() {
      _obsecuretext = !_obsecuretext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: TextField(
                style: const TextStyle(fontSize: 15),
                obscureText: _obsecuretext,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obsecuretext
                          ? Icons.remove_red_eye_rounded
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: _toggle,
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const []),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: .1.r),
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  highlightElevation: 0,
                  textColor: Colors.white,
                  color: const Color.fromARGB(255, 235, 219, 174),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>const Dashboard(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: const Divider(
                      color: Colors.black,
                    ),
                  ),
                ),
                const Text('OR'),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 10),
                    child: const Divider(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/icons8-google-48.png',
                        scale: 1.5,
                      ),
                      const Text(
                        "Google",
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ],
                  ),
                ),
                // Card(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       IconButton(
                //         onPressed: () {},
                //         icon: const Icon(
                //           FontAwesomeIcons.facebook,
                //           color: Colors.blue,
                //         ),
                //       ),
                //       const Text(
                //         "facebook",
                //       ),
                //     ],
                //   ),
                // ),
                Card(
                  child: Row(
                    children: [
                      Image.asset('assets/icons/Facebook-logo.png', scale: 45),
                      const Text(
                        "Facebook",
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account?'),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign Up',
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
          ],
        ),
      ),
    );
  }
}

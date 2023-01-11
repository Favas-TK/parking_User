import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parking_user/dashboard/dashboard.dart';
import 'package:parking_user/login/view/login.dart';
import 'package:parking_user/splashscreen/bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final _splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashBloc..add(NavigateToLoginEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          //   print(state);
          if (state is NavigateToHomeState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => const Dashboard(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => const Login(),
              ),
            );
          }
        },
        child: Scaffold(
          // backgroundColor:
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 235, 219, 174),
                      // offset: Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.h),
                  ),
                ),
                //color: Color.fromARGB(255, 235, 219, 174),
                child: Image.asset('assets/images/welcomeScreen.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(right: 150.h),
                child: Text(
                  'Welcome to \n Parking',
                  style: GoogleFonts.abrilFatface(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 160, 103, 98),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

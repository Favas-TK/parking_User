import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parking_user/login/login.dart';
import 'package:parking_user/signup/bloc/registration_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _regbloc = RegistrationBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _regbloc,
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
            );
          } else if (state is SignUpFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 235, 219, 174),
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
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter validate mail';
                      }
                      return null;
                    },
                    controller: mailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Password should be more than 6 charrecters';
                      }
                      return null;
                    },
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    validator: (value) {
                      if (passwordController.text != cpasswordController.text) {
                        return 'password must be same';
                      }
                      return null;
                    },
                    controller: cpasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
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
                        'SignUp',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processing Data'),
                            ),
                          );
                          _regbloc.add(
                            RegisterEvent(
                              name: nameController.text,
                              mail: mailController.text,
                              passwrd: passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
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
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: const Text(
                            'Login',
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _enabletext = false;
  void _toggle() {
    setState(() {
      _enabletext = !_enabletext;
    });
  }

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
                'My Profile',
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
        children: <Widget>[
          
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: const NetworkImage(
                  'https://th.bing.com/th/id/OIP.HhQwBlSw5S3JURg2BWGZZgHaLy?pid=ImgDet&rs=1',
                ),
                // ignore: prefer_const_literals_to_create_immutables
                child: Stack(
                  children: const [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Name',
                          enabled: _enabletext //disabel this text field input
                          ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'email',
                      ),
                      enabled: _enabletext, //dsable this textformfield input
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Address',
                        enabled: _enabletext,
                      ),
                    ),
                  ],
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
                    onPressed: _toggle,
                    child: Text(
                      _enabletext ? 'Save' : 'Edit Profile',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({super.key});

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
                'Settings',
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
         
          SizedBox(height: 20,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  shadowColor: Colors.redAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: const Color.fromARGB(255, 210, 212, 205),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.help,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        title: const Text(
                          'Help & Support',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  shadowColor: Colors.redAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: const Color.fromARGB(255, 210, 212, 205),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.privacy_tip,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        title: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  shadowColor: Colors.redAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: const Color.fromARGB(255, 210, 212, 205),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        title: const Text(
                          'Language',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  shadowColor: Colors.redAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: const Color.fromARGB(255, 210, 212, 205),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.bookmark_outline,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        title: const Text(
                          'Terms & Condition',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  shadowColor: Colors.redAccent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: const Color.fromARGB(255, 210, 212, 205),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        textColor: Colors.white,
                        title: const Text(
                          'Security',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Text('sdfsdfsdf'),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

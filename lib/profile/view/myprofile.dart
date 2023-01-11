import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final users = FirebaseFirestore.instance.collection('Users');
  final auth = FirebaseAuth.instance;
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!;
            nameController.text = userData['userName'].toString();
            return ListView(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    // CircleAvatar(
                    //   radius: 50,
                    //   child: Stack(
                    //     children: const [
                    //       Align(
                    //         alignment: Alignment.bottomRight,
                    //         child: Icon(
                    //           Icons.edit,
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: getImage,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: (userData['profileImage'] == '')
                            ? Text(
                                userData['userName'][0]
                                    .toString()
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              )
                            : ClipOval(
                                child: Image.network(
                                  userData['profileImage'].toString(),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                labelText: 'Name',
                                enabled:
                                    _enabletext //disabel this text field input
                                ),
                          ),
                          TextField(
                            controller: mailController,
                            decoration: const InputDecoration(
                              labelText: 'email',
                            ),
                            enabled:
                                _enabletext, //dsable this textformfield input
                          ),
                          TextField(
                            controller: addressController,
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
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> getImage() async {
    final _imagePicker = ImagePicker();
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      await updateProfile(image!);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProfile(XFile image) async {
    final reference =
        FirebaseStorage.instance.ref().child('profileImages').child(image.name);
    final file = File(image.path);
    await reference.putFile(file);
    final imageLink = await reference.getDownloadURL();
    await users.doc(auth.currentUser!.uid).update({'profileImage': imageLink});

    print(imageLink);
  }
}

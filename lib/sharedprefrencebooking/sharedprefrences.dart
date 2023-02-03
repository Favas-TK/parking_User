import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefe {
  Future<void> setUserData(
  String object
  ) async {
    final pref = await SharedPreferences.getInstance();
    // await pref.setString('datetime', datetime.toIso8601String());
    // await pref.setString('time_needs', timeneed);
    // await pref.setString('car', carname);

    var myMap = {
  'datetime': '',
  'time_needs': '',
  'carname': '',
};

var bookingData = json.encode(myMap);


        final  counter = (pref.getString('counter') ?? '') ;





  }

  Future<Map> getUserData(
    DateTime datetime,
    String timeneed,
    String carname,
  ) async {
    final pref = await SharedPreferences.getInstance();
    final datetime = DateTime.parse(pref.getString('datetime')!);
    final timeneed = pref.getString('time_needs');
    final carname = pref.getString('car');

    final booking = {
      'datetime': datetime,
      'time_needs': timeneed,
      'car': carname,
    };
    return booking;
  }
}

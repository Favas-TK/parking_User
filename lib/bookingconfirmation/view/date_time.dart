import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:parking_user/bookingconfirmation/view/vehicle%20details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateTimes extends StatefulWidget {
  DateTimes({super.key});

  State<DateTimes> createState() => _DateTimesState();
}

class _DateTimesState extends State<DateTimes> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(200),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  Future _selectedDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    if (date == null) return;
    final time = await _selectTime(context);
    if (time == null) return;
    setState(() {
      dateTime =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  String getDate() {
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime() {
    if (selectedTime == null) {
      return 'select timer';
    } else {
      return DateFormat('yyyy-M-dd HH: ss a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  TextEditingController parkingTime = TextEditingController();

  final orderData = <String> [];

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
                'Date Time',
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.h,
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 15),
              //   width: double.infinity,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         _selectTime(context);
              //       },
              //       child: Text('Time picker')),
              // ),
              if (showTime)
                Center(
                  child: Text(getTime(selectedTime)),
                )
              else
                Card(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        child: MaterialButton(
                          color: const Color.fromARGB(255, 235, 219, 174),
                          onPressed: () {
                            _selectedDateTime(context);
                            showDateTime = true;
                          },
                          child: const Text('Selected Date and Time '),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      if (showDateTime)
                        Text(
                          getDateTime(),
                        ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: parkingTime,
                          decoration: InputDecoration(
                            labelText: 'Time needed for parking',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[+]*[(]{0,1}[0-9]{1-4}[)]{0-1}[-\s\./0-9]+$')
                                    .hasMatch(value)) {
                              return 'Invalid';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              SizedBox(
                height: 200.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 300.h,
                  height: 50.h,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    highlightElevation: 0,
                    textColor: Colors.white,
                    color: const Color.fromARGB(255, 235, 219, 174),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async{
      

                      final pref = await SharedPreferences.getInstance();
                      await pref.setString('date', selectedDate.toIso8601String());
                      await pref.setString('datetime', selectedTime.toString());
                      await pref.setString('duration', selectedDate.toIso8601String());


                     await Navigator.push(context, MaterialPageRoute<dynamic>(
                        builder: (context) => VehicleDetails(),));


                    },
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:parking_user/bookingconfirmation/view/payment.dart';

class DateTimes extends StatefulWidget {
  const DateTimes({super.key});

  @override
  State<DateTimes> createState() => _DateTimesState();
}

List<String> list = <String>[
  '1 hr',
  '2 hr ',
  '3 hr',
  '4 hr',
  '5 hr',
  '6 hr',
  '7 hr',
];
String dropdownValue = list.first;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              const SizedBox(),
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
                    height: 100.h,
                  ),
                  if (showDateTime)
                    Text(
                      getDateTime(),
                    ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Choose Parking Time',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                        ),
                        elevation: 16,
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  //      else{ SizedBox(
                  //   height: 30.h,
                  // ),}

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        highlightElevation: 0,
                        onPressed: () {},
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        highlightElevation: 0,
                        color: const Color.fromARGB(255, 235, 219, 174),
                        onPressed: () {},
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 300.h,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Paymentss(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

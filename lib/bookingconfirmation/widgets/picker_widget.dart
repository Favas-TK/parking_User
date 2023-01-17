import 'package:flutter/material.dart';

class PickerItem{
  PickerItem(this.label, this.icon);
  String label;
  String icon;
}

class PickerWidget extends StatefulWidget {
  const PickerWidget({
    Key? key,
    required this.pickerItems,
  }) : super(key: key);

  final List<PickerItem> pickerItems;

  @override
  _PickerWidgetState createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        PickerItem pickerItem = widget.pickerItems[index];
        bool isItemSelected = index == selectedIndex;
        return InkWell(
          onTap: () {
            selectedIndex = index;
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            decoration: BoxDecoration(
              // color: Color(0xff04385f),
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Container(
                  //   height: 24,
                  //   child: Image.asset('images/cod.png'),
                  // ),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      pickerItem.label,
                      style: TextStyle(
                        color: Color(0xff04385f),
                        fontFamily: 'UbuntuMedium',
                      ),
                    ),
                  ),
                  isItemSelected
                      ? Icon(
                          Icons.check_circle,
                          size: 16,
                          color: Colors.green,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: widget.pickerItems.length,
    );
  }
}

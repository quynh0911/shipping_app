import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DateTimePicker extends StatefulWidget {
  DateTimePicker({Key? key}) : super(key: key);

  @override
  _DateTimePickerState createState() => new _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, right: 40),
          child: Text(
            "Giao lúc: ",
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            DatePicker.showDateTimePicker(context,
                showTitleActions: true,
                minTime: DateTime(2020, 1, 1),
                maxTime: DateTime(2030, 1, 1), onChanged: (date) {
              dateTime = date;
              setState(() {});
            }, onConfirm: (date) {
              dateTime = date;
              setState(() {});
            }, currentTime: dateTime, locale: LocaleType.vi);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(135, 123, 123, 0.3))),
          child: Text(
            dateTime.hour.toString() +
                "h" +
                dateTime.minute.toString() +
                " ngày " +
                dateTime.day.toString() +
                "/" +
                dateTime.month.toString() +
                "/" +
                dateTime.year.toString(),
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

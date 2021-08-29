import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State {
  // Group Value for Radio Button.
  int id = 1;
  DateTime dateTime = DateTime.now();

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  id = 1;
                });
              },
            ),
            Text(
              'Giao ngay',
              style: TextStyle(fontSize: 14.0),
            ),
            Radio(
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  id = 2;
                });
              },
            ),
            Text(
              'Giao lúc: ',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
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

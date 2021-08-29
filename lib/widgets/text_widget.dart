import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';

InputDecoration textFieldInputDecoration(
    String hintText, String labelText, String? errorText,
    {Icon? leadingicon}) {
  return InputDecoration(
    icon: leadingicon,
    hintText: hintText,
    labelText: labelText,
    errorText: errorText,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent),
    ),
  );
}

Container textView(BuildContext context, String contentText) {
  double screenWidth = MediaQuery.of(context).size.width;
  double boundWidth = 0;
  if (screenWidth < 400)
    boundWidth = screenWidth * 19 / 20;
  else if (screenWidth < 600)
    boundWidth = screenWidth * 9 / 10;
  else
    boundWidth = screenWidth * 7 / 10;
  double paddingWidth = (screenWidth - boundWidth) / 2;
  return Container(
    width: boundWidth,
    height: 40 + paddingWidth * 1 / 4,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 2.0, color: AppColors.blue),
      ),
    ),
    alignment: Alignment.centerLeft,
    child: Text(
      contentText,
      style: TextStyle(
        fontSize: boundWidth * 1 / 30,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

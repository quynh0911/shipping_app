import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(
    String hintText, String labelText, String? errorText) {
  return InputDecoration(
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

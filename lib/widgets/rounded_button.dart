import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Color primaryColor; // background Color
  final Color onPrimaryColor; //foreground color
  final Function() press;
  const RoundButton({
    Key? key,
    required this.text,
    required this.primaryColor,
    required this.onPrimaryColor,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    );
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: size.width * 0.6,
      child: ElevatedButton(
        onPressed: this.press,
        child: Text(this.text),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          primary: this.primaryColor,
          onPrimary: this.onPrimaryColor,
          shape: shape,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/widgets/edit_text_input_decoration.dart';
import 'package:flutter_application/widgets/rounded_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: textFieldInputDecoration(
                          "your email", "Your email", ""),
                      keyboardType: TextInputType.phone,
                    ),
                    RoundButton(
                        text: "Send to login",
                        primaryColor: AppColors.pantanoBlue,
                        onPrimaryColor: Colors.white,
                        press: () {})
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

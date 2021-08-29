/* This is the starting point of the application.
All the application level configurations are defined
in this file i.e, theme, routes, title, orientation etc.*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/screens/login/login.dart';
import 'package:flutter_application/screens/shipper/home_shipper/local/home_shipper.dart';
import 'package:flutter_application/screens/shipper/manage_order/main_manage_order.dart';
import 'package:flutter_application/screens/splash/splash_screen.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.pantanoBlue,
      ),
      routes: Routes.routes,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

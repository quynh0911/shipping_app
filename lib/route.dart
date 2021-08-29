/*This file
contains all the routes
for your application.*/

import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/user_mainframe.dart';
import 'package:flutter_application/screens/admin/add_to_market/main_add_to_market.dart';
import 'package:flutter_application/screens/admin/addstore/add_store.dart';
import 'package:flutter_application/screens/admin/shipper/select_shipper.dart';

import 'package:flutter_application/screens/login/login.dart';

import 'package:flutter_application/screens/signup/signup.dart';

import 'package:flutter_application/widgets/admin_mainframe.dart';
import 'package:flutter_application/widgets/shipper_mainframe.dart';

class Routes {
  Routes._();

  //static variables
  static const String adminHome = "/adminHome";

  static const String login = "/login";
  static const String register = '/register';
  static const String resetPassword = '/resetPassword';

  static const String profile = '/profile';
  static const String changePassword = '/changePassword';

  static const String aboutApp = '/aboutApp';
  static const String contact = '/contact';
  static const String addStore = "/addStore";
  static const String addToMarket = "/addToMarket";

  static const String userHome = "/userHome";
  static const String reviewStore = "/reviewStore";
  static const String shipperSelectStart = "/shipperSelectStart";
  static const String addAddress = "/addAddress";

  static const String shipperHome = "/shipperHome";

  static final routes = <String, WidgetBuilder>{
    userHome: (BuildContext context) => UserMainframeStart(
          selectedIndex: 0,
        ),
    login: (BuildContext context) => LoginScreen(),
    register: (BuildContext context) => SignUpScreen(),
    adminHome: (BuildContext context) => AdminMainframeStart(
          selectedIndex: 0,
        ),
    addStore: (BuildContext context) => AddStore(),
    addToMarket: (BuildContext context) => MainAddToMarket(),
    shipperSelectStart: (BuildContext context) => ShipperSelectStart(),
    shipperHome: (BuildContext context) => ShipperMainframeStart(
          selectedIndex: 0,
        ),
  };
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_application/constances/colors.dart';

import 'package:flutter_application/data/apis/user_api.dart';
import 'package:flutter_application/data/sharedpref/shared_preferences_helper.dart';
import 'package:flutter_application/models/user.dart';

import '../../route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool first = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!first) {
      first = true;
      _navigate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),
          SizedBox(
            height: 20,
          ),
          SpinKitCircle(
            color: AppColors.blue,
            size: 50,
          )
        ],
      ),
    );
  }

  _navigate() async {
    SharedPreferenceHelper preferenceHelper = SharedPreferenceHelper();
    String? token = await preferenceHelper.authToken;
    UserApi userApi = UserApi();
    if (token != null) {
      try {
        print(token);
        User? user = await userApi.getUserInfo();
        print("Đăng nhập");
        if (user!.authorities.contains("ROLE_ADMIN")) {
          Navigator.of(context).pushReplacementNamed(Routes.adminHome);
        } else if (user.authorities.contains("ROLE_SHIPPER")) {
          Navigator.of(context).pushReplacementNamed(Routes.shipperHome);
        } else {
          Navigator.of(context).pushReplacementNamed(Routes.userHome);
        }
      } catch (e) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.login, (Route<dynamic> route) => false);
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 1500));
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}

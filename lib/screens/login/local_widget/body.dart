import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/constances/network.dart';
import 'package:flutter_application/data/apis/user_api.dart';
import 'package:flutter_application/data/sharedpref/shared_preferences_helper.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/providers/auth/auth_provider.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/screens/forgetpassword/forgetpassword.dart';
import 'package:flutter_application/screens/signup/signup.dart';
import 'package:flutter_application/utils/notification/notification_utils.dart';
import 'package:flutter_application/widgets/edit_text_input_decoration.dart';
import 'package:flutter_application/widgets/rounded_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  late AuthProvider _authProvider;
  bool seePass = true;
  @override
  void didChangeDependencies() {
    _authProvider = Provider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 19 / 20;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 9 / 10;
    else
      boundWidth = screenWidth * 7 / 10;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: AppColors.blue,
          title: new Text(
            "Giao hàng siêu tốc Lục Nam",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(
                top: 20 + paddingWidth / 5,
                bottom: 20 + paddingWidth / 5,
                left: paddingWidth,
                right: paddingWidth),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/logo.png"),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: textFieldInputDecoration("Tên đăng nhập",
                          "Tên đăng nhập", _authProvider.loginError),
                      onChanged: (value) {
                        _authProvider.changeLogin(value);
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextField(
                      obscureText: seePass,
                      onChanged: (inputPass) {
                        _authProvider.changePassword(inputPass);
                      },
                      decoration: textFieldInputDecoration(
                          "Mật khẩu", "Mật khẩu", _authProvider.passwordError),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgetPassword();
                      }));
                    },
                    child: Text(
                      "Quên mật khẩu",
                      style: TextStyle(color: AppColors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 40 + paddingWidth / 5,
                      bottom: 40 + paddingWidth / 5,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_authProvider.isValid()) {
                          _login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.blue,
                          side: BorderSide(color: AppColors.blue, width: 2),
                          padding: EdgeInsets.only(
                              left: 30.0 + paddingWidth * 1 / 20,
                              right: 30.0 + paddingWidth * 1 / 20,
                              top: 10.0 + paddingWidth * 1 / 20,
                              bottom: 10.0 + paddingWidth * 1 / 20),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: boundWidth * 1 / 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn chưa có tài khoản?",
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUpScreen();
                          }));
                        },
                        child: Text(
                          " Đăng ký ngay",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    UserApi userApi = UserApi();
    SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
    try {
      print(Endpoints.userLoginUrl);
      print("Username: " + _authProvider.login!);
      print("Password: " + _authProvider.password!);
      await userApi.login(_authProvider.login!, _authProvider.password!);
      User? user = await userApi.getUserInfo();

      if (user!.authorities.contains("ROLE_ADMIN")) {
        Navigator.of(context).pushReplacementNamed(Routes.adminHome);
      } else if (user.authorities.contains("ROLE_USER")) {
        Navigator.of(context).pushReplacementNamed(Routes.userHome);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.shipperHome);
      }
    } catch (e) {
      print(e.toString());
      print("Error");
    }
  }
}

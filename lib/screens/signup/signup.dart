import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/data/apis/user_api.dart';
import 'package:flutter_application/models/address.dart';
import 'package:flutter_application/providers/signup_provider.dart/signup_provider.dart';

import 'package:flutter_application/screens/login/login.dart';

import 'package:flutter_application/screens/users/address/choose_address.dart';
import 'package:flutter_application/utils/notification/notification_utils.dart';
import 'package:flutter_application/widgets/edit_text_input_decoration.dart';
import 'package:flutter_application/widgets/rounded_button.dart';

main(List<String> args) {
  runApp(SignUpScreen());
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
      create: (_) => SignUpProvider(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: AppColors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            color: AppColors.yellow,
            onPressed: () => Navigator.pop(context),
          ),
          title: new Text(
            "Đăng ký",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SignUpScreenBody(),
      ),
    ));
  }
}

class SignUpScreenBody extends StatefulWidget {
  @override
  _SignUpScreenState createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreenBody> {
  TextEditingController controllerFirstName = new TextEditingController();
  TextEditingController controllerLastName = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerConfirmPass = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  TextEditingController controllerLogin = new TextEditingController();
  TextEditingController controllerAddress = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  late SignUpProvider validationService;
  Address address = Address(
      latitude: 1, longitude: 3, name: "name", phone: "097", description: "Hi");

  @override
  void didChangeDependencies() {
    validationService = Provider.of(context);
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
    return Form(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(
              top: 10 + paddingWidth / 5,
              bottom: 10 + paddingWidth / 5,
              left: paddingWidth,
              right: paddingWidth),
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  radius: boundWidth * 1 / 6,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: controllerLogin,
                  onChanged: (String value) {
                    validationService.changeLogin(value);
                  },
                  decoration: textFieldInputDecoration("Tên đăng nhập",
                      "Tên đăng nhập", validationService.login.error),
                ),
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: controllerFirstName,
                  onChanged: (String value) {
                    validationService.changeFirstName(value);
                  },
                  decoration: textFieldInputDecoration(
                      "Họ", "Họ", validationService.firstName.error),
                ),
              ),
              Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: controllerLastName,
                  onChanged: (String value) {
                    validationService.changeLastName(value);
                  },
                  decoration: textFieldInputDecoration(
                      "Tên", "Tên", validationService.lastName.error),
                ),
              ),
              Container(
                child: TextField(
                  onChanged: (value) => validationService.changeEmail(value),
                  controller: controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: textFieldInputDecoration(
                      "Email", "Email", validationService.email.error),
                ),
              ),
              Container(
                child: TextField(
                    onChanged: (value) => validationService.changePhone(value),
                    controller: controllerPhone,
                    keyboardType: TextInputType.phone,
                    decoration: textFieldInputDecoration("Số điện thoại",
                        "Số điện thoại", validationService.phone.error)),
              ),
              Container(
                child: TextField(
                  controller: controllerPass,
                  onChanged: (value) => validationService.changePassword(value),
                  decoration: textFieldInputDecoration(
                      "Mật khẩu", "Mật khẩu", validationService.password.error),
                  obscureText: true,
                ),
              ),
              Container(
                child: TextField(
                  controller: controllerConfirmPass,
                  obscureText: true,
                  onChanged: (String value) {
                    validationService.changeConfirmPassword(value);
                  },
                  decoration: textFieldInputDecoration(
                      "Nhắc lại mật khẩu",
                      "Nhắc lại mật khẩu",
                      validationService.confirmPassword.error),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Visibility(
                        visible: !validationService.haveAddress,
                        child: Container(
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ChooseAddressStart(
                                              address: address,
                                            )));
                                validationService.changeBool();
                              },
                              child: Text("Thêm địa chỉ")),
                        ),
                      ),
                    ),
                    Container(
                      child: Visibility(
                        child: Flexible(
                          child: TextField(
                            controller: controllerAddress,
                            decoration: textFieldInputDecoration(
                                "Mô tả địa chỉ", "", ""),
                          ),
                        ),
                        visible: validationService.haveAddress,
                      ),
                    ),
                    Container(
                      child: Visibility(
                        visible: validationService.haveAddress,
                        child: TextButton(
                          onPressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ChooseAddressStart(
                                          address: address,
                                        )));
                            setState(() {});
                          },
                          child: Text(
                            "Chỉnh sửa",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10 + paddingWidth / 5,
                  bottom: 20 + paddingWidth / 5,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    validationService.changeLogin(controllerLogin.text);
                    validationService.changeFirstName(controllerFirstName.text);
                    validationService.changeLastName(controllerLastName.text);
                    validationService
                        .changeConfirmPassword(controllerConfirmPass.text);
                    // validationService.changeAddress(address.description);
                    validationService.changeLatLon(address.latitude,
                        address.longitude, address.description);
                    validationService.changePhone(controllerPhone.text);
                    validationService.changePassword(controllerPass.text);
                    if (validationService.isValid) {
                      validationService.submitData();
                      _signup();
                    } else {}
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
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: boundWidth * 1 / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void _signup() async {
    UserApi _userApi = UserApi();
    try {
      print("Đăng ký");
      var response = await _userApi.post(validationService.user);
      if (response.statusCode == 201) {
        print("Đăng ký thành công");
        showWarningDialog("Đăng ký thành công", context, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      } else if (response.statusCode == 500) {
        // showWarningDialog("Tài khoản đăng nhập, email hoặc số điện thoại bị trùng", context, ())
      }
    } catch (e) {
      print("Lỗi");
    }
  }
}

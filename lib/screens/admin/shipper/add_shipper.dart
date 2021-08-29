import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/providers/signup_provider.dart/signup_provider.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/widgets/edit_text_input_decoration.dart';

main(List<String> args) {
  runApp(AddShipperStart());
}

class AddShipperStart extends StatelessWidget {
  AddShipperStart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
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
            "Thêm Shipper",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: AddShipperState(),
      ),
    );
  }
}

class AddShipperState extends StatefulWidget {
  AddShipperState({
    Key? key,
  }) : super(key: key);

  @override
  _AddShipperState createState() => _AddShipperState();
}

class _AddShipperState extends State<AddShipperState> {
  late SignUpProvider validationService;
  bool isSuccess = false;
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
      boundWidth = screenWidth * 0.9;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 0.95;
    else
      boundWidth = screenWidth * 0.7;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: 20 + paddingWidth / 5,
              bottom: 20 + paddingWidth / 5,
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
                height: boundWidth * 1 / 10,
                alignment: Alignment.center,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: AppColors.brown,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColors.gray, width: 2),
                      padding: EdgeInsets.only(
                          left: 10.0 + paddingWidth * 1 / 20,
                          right: 10.0 + paddingWidth * 1 / 20,
                          top: 2.0 + paddingWidth * 1 / 20,
                          bottom: 2.0 + paddingWidth * 1 / 20),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                  onPressed: () {},
                  child: Text(
                    "Tải ảnh lên",
                    style: TextStyle(
                        color: AppColors.gray,
                        fontSize: boundWidth * 1 / 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: textFieldInputDecoration("Tên đăng nhập",
                      "Tên đăng nhập", validationService.login.error),
                  onChanged: (value) {
                    validationService.changeLogin(value);
                  },
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: textFieldInputDecoration(
                      "Họ", "Họ", validationService.firstName.error),
                  onChanged: (value) {
                    validationService.changeFirstName(value);
                  },
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: textFieldInputDecoration(
                      "Tên", "Tên", validationService.lastName.error),
                  onChanged: (value) {
                    validationService.changeLastName(value);
                  },
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: textFieldInputDecoration("Số điện thoại",
                      "Số điện thoại", validationService.phone.error),
                  onChanged: (value) {
                    validationService.changePhone(value);
                  },
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: textFieldInputDecoration(
                      "Email", "Email", validationService.email.error),
                  onChanged: (value) {
                    validationService.changeEmail(value);
                  },
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: textFieldInputDecoration(
                      "Địa chỉ", "Địa chỉ", validationService.address.error),
                  onChanged: (value) {
                    validationService.changeAddress(value);
                  },
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    validationService.changePassword(value);
                  },
                  decoration: textFieldInputDecoration(
                      "Mật khẩu", "Mật khẩu", validationService.password.error),
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    validationService.changeConfirmPassword(value);
                  },
                  decoration: textFieldInputDecoration(
                      "Nhập lại mật khẩu",
                      "Nhập lại mật khẩu",
                      validationService.confirmPassword.error),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 40 + paddingWidth / 5,
                  bottom: 40 + paddingWidth / 5,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (validationService.isValid) {
                      validationService.submitData();
                      validationService.changeRoleShipper();
                      print(validationService.address.value);
                      print(validationService.email.value);
                      print(validationService.firstName.value);
                      print(validationService.lastName.value);
                      print(validationService.password.value);
                      print(validationService.confirmPassword.value);
                      print(validationService.user.toJson());
                      print(validationService.isValid.toString());
                      validationService.isSignUpShipper();

                      if (validationService.isSuccess) {
                        Navigator.pushReplacementNamed(
                            context, Routes.shipperSelectStart);
                        print("Đăng ký thành công");
                      }
                    } else {
                      validationService.logError();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.blue,
                      side: BorderSide(color: AppColors.blue, width: 2),
                      padding: EdgeInsets.only(
                          left: 20.0 + paddingWidth * 1 / 20,
                          right: 20.0 + paddingWidth * 1 / 20,
                          top: 10.0 + paddingWidth * 1 / 20,
                          bottom: 10.0 + paddingWidth * 1 / 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(boundWidth / 10)))),
                  child: Text(
                    "Thêm shipper",
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: boundWidth * 1 / 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    validationService.dispose();
    super.dispose();
  }
}

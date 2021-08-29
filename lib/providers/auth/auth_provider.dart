import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isEmailValid(String email) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool isLogin(String value) {
    var pattern =
        r'^(?>[a-zA-Z0-9!$&*+=?^_`{|}~.-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*)|(?>[_.@A-Za-z0-9-]+)$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  String? login;
  String? password;
  String? loginError;
  String? passwordError;

  void changeLogin(String value) {
    if (value.length >= 1 && value.length <= 50) {
      login = value;
      loginError = null;
    } else {
      login = null;
      loginError = "Tên đăng nhập có đô dài nhiều hơn 1 ký tự, ít hơn 50 ký tự";
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 4 && value.length <= 100) {
      password = value;
      passwordError = null;
    } else {
      password = null;
      passwordError = "Mật khẩu phải có độ dài nằm trong khoảng từ 4 đến 100";
    }
    notifyListeners();
  }

  bool isValid() {
    if (login != null && password != null) return true;
    return false;
  }
}

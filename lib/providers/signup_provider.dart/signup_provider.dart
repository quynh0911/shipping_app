import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application/data/apis/user_api.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/utils/map_service/getLongLat.dart';

class SignUpProvider extends ChangeNotifier {
  User user = User(
      login: "Mi Phong",
      firstName: "Quỳnh",
      lastName: "Phạm Thị Hương",
      email: "phamquynh@gmail.com",
      address: "HY",
      phone: "094",
      activated: true,
      authorities: ["ROLE_USER"]);
  ValidationItem _firstName = ValidationItem(null, null);
  ValidationItem _lastName = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _login = ValidationItem(null, null);
  ValidationItem _phone = ValidationItem(null, null);
  ValidationItem _address = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _confirmPassword = ValidationItem(null, null);
  double _latitude = 0.0;
  double _longitude = 0.0;
  bool isSuccess = false;
  bool isChooseAddressScreen = false;

  //get
  ValidationItem _form = ValidationItem(null, null);
  ValidationItem get firstName => _firstName;
  ValidationItem get lastName => _lastName;
  ValidationItem get email => _email;
  ValidationItem get login => _login;
  ValidationItem get form => _form;
  ValidationItem get phone => _phone;
  ValidationItem get address => _address;
  ValidationItem get password => _password;
  ValidationItem get confirmPassword => _confirmPassword;
  double get latitude => _latitude;
  double get longitude => _longitude;

  //set
  void changeFirstName(String value) {
    if (value.length >= 2) {
      _firstName = ValidationItem(value, null);
    } else {
      _firstName = ValidationItem(null, "Must be at least 2 characters");
    }
    notifyListeners();
  }

  bool isLogin(String value) {
    var pattern =
        r'^(?>[a-zA-Z0-9!$&*+=?^_`{|}~.-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*)|(?>[_.@A-Za-z0-9-]+)$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }

  void changeLogin(String value) {
    if (value.length >= 1 && value.length <= 50) {
      _login = ValidationItem(value, null);
    } else {
      _login = ValidationItem(
          null, "Tên tài khoản cần có nhiều hơn 1 ký tự và ít hơn 50 ký tự");
    }
    notifyListeners();
  }

  void changeAddress(String value) {
    _address = ValidationItem(value, null);
    notifyListeners();
  }

  void changeLastName(String value) {
    if (value.length >= 2) {
      _lastName = ValidationItem(value, null);
    } else {
      _lastName = ValidationItem(null, "Must be at least 2 characters");
    }
    notifyListeners();
  }

  bool haveAddress = false;
  void changeBool() {
    haveAddress = true;
    notifyListeners();
  }

  void changeLatLon(double latitude, double longitude, String des) {
    user.latitude = latitude;
    user.longitude = longitude;
    user.address = des;
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 4 && value.length <= 100) {
      _password = ValidationItem(value, null);
      changeConfirmPassword(
          _confirmPassword.value == null ? "" : _confirmPassword.value!);
    } else {
      _password = ValidationItem(
          null, "Mật khẩu phải có độ dài nằm trong khoảng từ 4 đến 100");
    }

    notifyListeners();
  }

  void changeConfirmPassword(String value) {
    if (password.value != value) {
      _confirmPassword = ValidationItem(null, "Must be like password!");
    } else if (value.length == 0) {
      _confirmPassword = ValidationItem(null, "Must be at least 4 characters");
    } else {
      _confirmPassword = ValidationItem(value, null);
    }
    notifyListeners();
  }

  bool isEmailValid(String email) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(email);
  }

  void changeEmail(String value) {
    if (value.length == 0) {
      _email = ValidationItem(null, "Please enter email!");
    } else if (!isEmailValid(value)) {
      _email = ValidationItem(null, "Please enter valid email");
    } else {
      _email = ValidationItem(value, null);
    }
    notifyListeners();
  }

  bool isValidPhoneNumber(String string) {
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  void changePhone(String value) {
    if (value.length == 0) {
      _phone = ValidationItem(null, "Please enter phone!");
    } else if (!isValidPhoneNumber(value)) {
      _phone = ValidationItem(null, "Please enter valid phone");
    } else {
      _phone = ValidationItem(value, null);
    }
    notifyListeners();
  }

  bool get isValid {
    if (_lastName.value != null &&
        _firstName.value != null &&
        _email.value != null &&
        _phone.value != null &&
        _password.value != null &&
        _confirmPassword.value != null) {
      return true;
    } else {
      return false;
    }
  }

  void submitData() {
    user.login = _login.value;
    user.email = _email.value!;
    user.phone = _phone.value!;
    user.firstName = _firstName.value!;
    user.lastName = _lastName.value!;
    user.password = _password.value!;
    user.address = _address.value;
    notifyListeners();
  }

  void changePosCurrent(double lat, double long) {
    _latitude = lat;
    _longitude = long;
  }

  Future isSignUp() async {
    UserApi _userApi = UserApi();
    try {
      var response = await _userApi.post(user);
      print("Response" + response.statusCode);
      if (response.statusCode == 201) {
        _form = ValidationItem(null, null);
        isSuccess = true;
      } else if (response.statusCode == 400) {
        _form = ValidationItem(response.data, response.data);
        print(response.data);
      }
    } catch (e) {}
    notifyListeners();
  }

  void setLatLongByGeolocator() async {
    GetLongLatCurrent _getLongLatCurr = GetLongLatCurrent();
    Position _position = await _getLongLatCurr.determinePosition();
    user.latitude = _position.latitude;
    user.longitude = _position.longitude;
    notifyListeners();
  }

  void setLatLongFromCustom(double lat, double long) {
    user.latitude = lat;
    user.longitude = long;
    notifyListeners();
  }

  void isSignUpShipper() async {
    UserApi _userApi = UserApi();
    try {
      var response = await _userApi.admin_post(user);
      if (response.statusCode == 201) {
        _form = ValidationItem(null, null);
      } else if (response.statusCode == 400) {
        _form = ValidationItem(response['violations']["field"],
            response['violations']['messages']);
        print(response.data);
      }
    } catch (e) {}
  }

  void changeRoleShipper() {
    user.authorities = ["ROLE_SHIPPER"];
    notifyListeners();
  }

  void logError() {
    if (_lastName.error == null && _lastName.value == null) {
      _lastName = ValidationItem(null, "Bạn chưa nhập trường này!");
    }
    if (_firstName.error == null && _firstName.value == null) {
      _firstName = ValidationItem(null, "Bạn chưa nhập trường này!");
    }
    if (_email.error == null && _email.value == null) {
      _email = ValidationItem(null, "Bạn chưa nhập trường này!");
    }
    if (_phone.error == null && _phone.value == null) {
      _phone = ValidationItem(null, "Bạn chưa nhập trường này!");
    }
    if (_address.error == null && _address.value == null) {
      _address = ValidationItem(null, "Bạn chưa nhập trường này!");
    }
    if (_password.error == null && _password.value == null) {
      _password = ValidationItem(null, "Bạn chưa nhập trường này!");
    }
    if (_confirmPassword.error == null && _confirmPassword.value == null) {
      _confirmPassword = ValidationItem(null, "Bạn chưa nhập trường này!");
    }
    notifyListeners();
  }
}

class ValidationItem {
  final String? value;
  final String? error;

  ValidationItem(this.value, this.error);
  set error(String? value) => error = value;
}

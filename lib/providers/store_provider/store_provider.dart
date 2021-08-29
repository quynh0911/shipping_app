import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_application/data/apis/store_api.dart';
import 'package:flutter_application/models/store.dart';

class StoreProvide extends ChangeNotifier {
  ProductStore _store = ProductStore(
      address: "",
      district: "",
      name: "",
      latitude: 0.0,
      longitude: 0.0,
      openTime: "",
      closeTime: "",
      phone: "");
  bool haveAddress = false;
  void changeBool() {
    haveAddress = true;
    notifyListeners();
  }

  ValidationItem _address = ValidationItem(null, null);
  String? _district;
  ValidationItem _name = ValidationItem(null, null);
  ValidationItem _phone = ValidationItem(null, null);
  String _openTime = "";
  String _closeTime = "";
  ValidationItem get name => _name;
  String get openTime => _openTime;
  void changeOpenTime(String a) {
    _openTime = a;
    notifyListeners();
  }

  ProductStore get productStore => _store;

  String? get district => this._district!;
  ValidationItem get phone => _phone;
  String get closeTime => _closeTime;
  void changecloseTime(String a) {
    _closeTime = a;
    notifyListeners();
  }

  void changeDistrict(String? s) {
    this._district = s;
    notifyListeners();
  }

  void changeName(String value) {
    if (value.length < 1) {
      _name = ValidationItem(null, "Tên cửa hàng phải có ít nhất 1 ký tự");
    } else
      _name = ValidationItem(value, null);
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

  bool isValid() {
    if (name.error == null && phone.error == null) return true;
    return false;
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

  void changeLatLon(double latitude, double longitude, String des) {
    _store.latitude = latitude;
    _store.longitude = longitude;
    _store.address = des;
    notifyListeners();
  }

  void submit(String name, String phone, String district) {
    print("Submit");
    _store.name = name;
    _store.phone = phone;
    print(listDistrict[district]);
    _store.district = listDistrict[district]!;
    _store.closeTime = this.closeTime;
    _store.openTime = this.openTime;
    notifyListeners();
  }

  Future createStore() async {
    print("Create Store request");
    StoreApi _storeApi = StoreApi();
    try {
      var res = await _storeApi.createStore(_store);
    } catch (e) {}
  }
}

class ValidationItem {
  String? value;
  String? error;
  ValidationItem(this.value, this.error);
}

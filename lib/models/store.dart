import 'package:flutter_application/models/district.dart';
import 'package:json_annotation/json_annotation.dart';

class ProductStore {
  int? _id;
  late String _address;
  late String _district;
  late String _name;
  late double _latitude;
  late double _longitude;
  late String _phone;
  late String _openTime;
  late String _closeTime;

  ProductStore(
      {int? id,
      required String address,
      required String district,
      required String name,
      required double latitude,
      required double longitude,
      required String phone,
      required String openTime,
      required String closeTime}) {
    this._id = id;
    this._address = address;
    this._district = district;
    this._name = name;
    this._latitude = latitude;
    this._longitude = longitude;
    this._phone = phone;
    this._openTime = openTime;
    this._closeTime = closeTime;
  }

  int? get id => this._id;
  set id(int? id) => this._id = id;

  String get name => _name;
  set name(String name) => this._name = name;

  String get address => _address;
  set address(String address) => this._address = address;

  String get phone => _phone;
  set phone(String phone) => this._phone = phone;

  double get latitude => _latitude;
  set latitude(double latitude) => this._latitude = latitude;

  double get longitude => _longitude;
  set longitude(double longitude) => this._longitude = longitude;

  String get district => this._district;
  set district(String district) => this._district = district;

  String get openTime => this._openTime;
  set openTime(String openTime) => this._openTime = openTime;

  String get closeTime => this._closeTime;
  set closeTime(String closeTime) => this._closeTime = closeTime;

  ProductStore.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _district = json['district'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _phone = json['phone'];
    _openTime = json['openTime'];
    _closeTime = json['closeTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this._address;
    data['closeTime'] = this._closeTime;
    data['district'] = this._district;
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    data['name'] = this._name;
    data['id'] = this._id;
    data['openTime'] = this._openTime;
    data['phone'] = this._phone;
    return data;
  }
}

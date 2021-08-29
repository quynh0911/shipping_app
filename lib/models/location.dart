import 'package:flutter_application/models/user.dart';

class Location {
  int? _id;
  late double _latitude;
  late double _longitude;
  User? _owner;

  Location(
      {required double latitude,
      required double longitude,
      int? id,
      User? owner}) {
    this._latitude = latitude;
    this._longitude = longitude;
    this._id = id;
    this._owner = owner;
  }

  double get latitude => this._latitude;
  set latitude(double latitude) => this._latitude = latitude;
  double get longitude => this._longitude;
  set longitude(double longitude) => this._longitude = longitude;
  int? get id => this._id;
  set id(int? id) => this._id = id;
  User? get owner => this._owner;
  set owner(User? owner) => this._owner = owner;

  Location.fromJson(Map<String, dynamic> json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _id = json['id'];
    _owner = json['owner'] != null ? new User.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this._latitude;
    data['longitude'] = this._longitude;
    if (this._owner != null) {
      data['owner'] = this._owner?.toJson();
    }
    data['id'] = this._id;
    return data;
  }
}

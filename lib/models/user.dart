class User {
  int? _id;
  String? _login; //username
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _phone;
  String? _address;
  late List<String> _authorities;
  String? _avatar;
  bool? _activated;
  double? _latitude;
  double? _longitude;
  String? _password;

  User(
      {int? id,
      String? login,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      String? address,
      required List<String> authorities,
      String? avatar,
      String? password,
      bool? activated,
      double? latitude,
      double? longitude}) {
    this._id = id;
    this._firstName = firstName;
    this._phone = phone;
    this._address = address;
    this._authorities = authorities;
    this._activated = activated;
    this._avatar = avatar;
    this._latitude = latitude;
    this._longitude = longitude;
    this._lastName = lastName;
    this._login = login;
    this._email = email;
    this._password = password;
  }

  int? get id => _id;
  set id(int? id) => this._id = id;
  String? get login => this._login;
  set login(String? login) => this._login = login;
  String get email => this._email;
  set email(String email) => this._email = email;
  String get phone => this._phone;
  set phone(String phone) => this._phone = phone;
  String? get address => this._address;
  set address(String? address) => this._address = address;
  String get firstName => this._firstName;
  set firstName(String firstName) => this._firstName = firstName;
  String get lastName => this._lastName;
  set lastName(String lastName) => this._lastName = lastName;
  double? get latitude => _latitude;
  set latitude(double? latitude) => this._latitude = latitude;
  double? get longitude => _longitude;
  set longitude(double? longitude) => this._longitude = longitude;
  bool? get activated => this._activated;
  set activated(bool? actived) => this._activated = activated;
  String? get avatar => this._avatar;
  set avatar(String? avatar) => this._avatar = avatar;
  List<String> get authorities => this._authorities;
  set authorities(List<String> authorities) => this._authorities = authorities;
  String? get password => this._password;
  set password(String? password) => this._password = password;
  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _login = json['login'];
    _lastName = json['lastName'];
    _email = json['email'];
    _activated = json['activated'];
    _address = json['address'];
    _longitude = json['longitude'];
    _phone = json['phone'];
    _latitude = json['latitude'];
    _avatar = json['avatar'];
    _activated = json['activated'];
    _authorities = json['authorities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) {
      data['id'] = this._id;
    }
    if (latitude != null) {
      data['latitude'] = this._latitude;
    }
    if (avatar != null) {
      data['avatar'] = this._avatar;
    }
    if (login != null) {
      data['login'] = this._login;
    }
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['activated'] = this._activated;
    if (address != null) {
      data['address'] = this._address;
    }
    if (longitude != null) {
      data['longitude'] = this._longitude;
    }

    data['activated'] = this._activated;
    if (password != null) {
      data['password'] = this._password;
    }
    data['authorities'] = List<dynamic>.from(this._authorities.map((x) => x));
    return data;
  }
}

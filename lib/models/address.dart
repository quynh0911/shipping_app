class Address {
  int? _id;
  late double _latitude;
  late double _longitude;
  late String _name;
  late String _phone;
  late String _description;

  Address({
    required double latitude,
    required double longitude,
    required String name,
    required String phone,
    required String description,
    int? id,
  }) {
    this._id = id;
    this._latitude = latitude;
    this._longitude = longitude;
    this._name = name;
    this._phone = phone;
    this._description = description;
  }

  double get latitude => this._latitude;
  set latitude(double latitude) => this._latitude = latitude;
  double get longitude => this._longitude;
  set longitude(double longitude) => this._longitude = longitude;
  int? get id => this._id;
  set id(int? id) => this._id = id;
  String get name => this._name;
  set name(String name) => this._name = name;
  String get phone => this._phone;
  set phone(String phone) => this._phone = phone;
  String get description => this._description;
  set description(String description) => this._description = description;
}

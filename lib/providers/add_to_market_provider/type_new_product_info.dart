import 'package:flutter/material.dart';

class TypeNewProductInfo extends ChangeNotifier {
  String? _name;
  int? _price;
  String? _unit;

  TypeNewProductInfo(this._name, this._price, this._unit);

  String get name => _name as String;
  int get price => _price as int;
  String get unit => _unit as String;

  void typeName(String text) {
    _name = text;
    notifyListeners();
  }

  void typePrice(String price) {
    _price = int.parse(price);
    notifyListeners();
  }

  void typeUnit(String unit) {
    _unit = unit;
    notifyListeners();
  }
}

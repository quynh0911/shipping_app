import 'dart:convert';

import 'package:flutter_application/models/product.dart';

class ProductType {
  late int _id;
  late String _name;

  ProductType({required int id, required String name}) {
    this._id = id;
    this._name = name;
  }
  int get id => this._id;
  set id(int id) => _id = id;
  String get name => this._name;
  set name(String name) => _name = name;
  ProductType.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}

// class ListProductType {
//   List<ProductType> _listProductType = [];

//   List<ProductType> get listProductType => _listProductType;
//   set listProductType(List<ProductType> list) => _listProductType = list;
// }

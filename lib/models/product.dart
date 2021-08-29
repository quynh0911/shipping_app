import 'package:flutter_application/models/product_type.dart';
import 'package:flutter_application/models/store.dart';
import 'package:json_annotation/json_annotation.dart';

class Product {
  int? _id;
  late bool _actived;
  late String _description;
  String? _image;
  String? _imageContentType;
  late String _name;
  late int _price;
  ProductStore? _store;
  late List<ProductType> _types;

  Product(
      {int? id,
      required bool actived,
      required String description,
      String? image,
      String? imageContentType,
      required String name,
      required int price,
      ProductStore? store,
      required List<ProductType> types}) {
    this._id = id;
    this._actived = actived;
    this._description = description;
    this._image = image;
    this._name = name;
    this._price = price;
    this._types = types;
    this._store = store;
    this._imageContentType = imageContentType;
  }

  int? get id => _id;
  set id(int? id) => this._id = id;

  bool get actived => _actived;
  set actived(bool actived) => this._actived = actived;

  String get description => _description;
  set description(String description) => this._description = description;

  String? get image => _image;
  set image(String? image) => this._image = image;

  String? get imageContentType => _imageContentType;
  set imageContentType(String? imageContentType) =>
      this._imageContentType = imageContentType;

  String get name => _name;
  set name(String name) => this._name = name;

  ProductStore? get store => _store;
  set store(ProductStore? store) => this._store = store;

  int get price => _price;
  set price(int price) => this._price = price;

  List<ProductType> get types => this._types;
  set types(List<ProductType> types) => this._types = types;
  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _types = json["types"].map<ProductType>((item) {
      return ProductType.fromJson(item);
    }).toList();
    _actived = json['actived'];
    _description = json['description'];
    _store = new ProductStore.fromJson(json['store']);
    _image = json['image'];
    _imageContentType = json['imageContentType'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) {
      data['id'] = this._id;
    }
    data['name'] = this._name;
    data['actived'] = this._actived;
    data['price'] = this._price;

    if (store != null) {
      data['store'] = this._store!.toJson();
    }

    data['description'] = this._description;
    if (image != null) {
      data['image'] = this._image;
    }
    if (imageContentType != null) {
      data['imageContentType'] = this._imageContentType;
    }

    data['types'] = this._types.map((e) => e.toJson()).toList();
    return data;
  }
}

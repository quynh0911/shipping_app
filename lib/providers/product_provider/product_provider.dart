import 'package:flutter/material.dart';
import 'package:flutter_application/data/apis/product_api.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/models/product_type.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/providers/signup_provider.dart/signup_provider.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/list_product.dart';

class ProductProvider extends ChangeNotifier {
  Product? _product;
  List<Product> _listProduct = [];
  bool addingState = false;
  List<ProductType> _listProductType = [];

  List<ProductType> get listProductType => _listProductType;
  List<Product> get ListProduct => _listProduct;

  Future<List<Product>> fetchDataAllProduct() async {
    _listProduct = await ProductApi().getAllProductsInfo();
    notifyListeners();
    return _listProduct;
  }

  Future<List<ProductType>> fetchDataAllProductType() async {
    _listProductType = await ProductTypeApi().getAllProductTypeApi();
    notifyListeners();
    return _listProductType;
  }

  Future postNewProduct() async {
    int statuscode = await ProductApi().postProduct(_product as Product);
    if (statuscode == 200) {
      addingState = true;
      print('Them thanh cong');
    }
    notifyListeners();
  }

//Add product to market, store property is null
  Future addNewProductMarket(
      String name, ProductType type, int price, String unit) async {
    print("Creating product");
    _product = Product(
        actived: true,
        description: 'Day là sản phẩm test',
        name: name,
        price: price,
        types: [type]);
    postNewProduct();
    notifyListeners();
  }

  Future addNewProductStore(String name, ProductType type, int price,
      String unit, ProductStore productStore) async {
    print("Creating product");
    _product = Product(
        actived: true,
        description: 'Day là sản phẩm test',
        name: name,
        price: price,
        store: productStore,
        types: [type]);
    postNewProduct();
    notifyListeners();
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_application/constances/network.dart';
import 'package:flutter_application/models/product.dart';

class GetProductsServices {
  String _url = Endpoints.getProductInfo;
  Dio? _dio;
  String? _id;

  GetProductsServices(String id) {
    _dio = Dio();
    _id = id;
  }

  Future<Product> fetchProducts() async {
    try {
      Response response = await _dio!.post(_url + '/' + (_id as String));
      Product product = Product.fromJson(response.data);
      return product;
    } on DioError catch (e) {
      print(e);
    }
    throw NullThrownError();
  }
}

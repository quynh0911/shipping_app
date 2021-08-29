import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application/constances/network.dart';
import 'package:flutter_application/data/dio/dio_client.dart';
import 'package:flutter_application/data/sharedpref/shared_preferences_helper.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/models/product_type.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/list_product.dart';

class ProductApi {
  Future<List<Product>> getAllProductsInfo() async {
    DioClient _dioClient = DioClient();
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    List<Product> l = [];
    try {
      final token =
          'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTYzMjQwNjMxN30.x_tzHAXa7BmSFg56GTJIe6o7AjOZTJk0lr5XUfrvUP4oiuBDigKstzdeTM2UBymlci11kAdy4-OPUa4LMHNkCQ'; //await _sharedPrefsHelper.authToken;
      print(token);

      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res =
          await _dioClient.get(Endpoints.getProductInfo, options: options);
      if (res.statusCode == 200) {
        print("Laays danh sach san pham thanh cong");
        l = res.data.map((e) => Product.fromJson(e)).toList();
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return l;
  }

  Future<Product> getProductInfo(int id) async {
    DioClient _dioClient = DioClient();
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    try {
      final token = await _sharedPrefsHelper.authToken;
      print(token);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var p = await _dioClient.get(Endpoints.getProductInfo + id.toString(),
          options: options);
      Product x = Product.fromJson(p);
      return x;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<int> postProduct(Product product) async {
    DioClient _dioClient = DioClient();
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    try {
      final token =
          'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTYzMjQwNjMxN30.x_tzHAXa7BmSFg56GTJIe6o7AjOZTJk0lr5XUfrvUP4oiuBDigKstzdeTM2UBymlci11kAdy4-OPUa4LMHNkCQ';
      print(token);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var data = product.toJson();
      print(product.toJson().toString());
      var res = await _dioClient.post(Endpoints.getProductInfo,
          data: data, options: options);
      if (res.statusCode == 201) {
        print("Thành công");
      }
      return res.statusCode;
    } on DioError catch (e) {
      print(e.toString());
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return 0;
  }
}

class ProductTypeApi {
  Future<List<ProductType>> getAllProductTypeApi() async {
    DioClient _dioClient = DioClient();
    List<ProductType> listProductType = [];
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    try {
      final token =
          'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTYzMjQwNjMxN30.x_tzHAXa7BmSFg56GTJIe6o7AjOZTJk0lr5XUfrvUP4oiuBDigKstzdeTM2UBymlci11kAdy4-OPUa4LMHNkCQ'; //await _sharedPrefsHelper.authToken;
      print(token);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var listTypes =
          await _dioClient.get(Endpoints.getProductType, options: options);
      print(listTypes.data);
      // Iterable l = json.decode(listTypes.body);
      // List<ProductType> listProductTye =
      //     listTypes.data.map((e) => ProductType.fromJson(e)).toList();
      for (var i in listTypes.data) {
        ProductType p = ProductType.fromJson(i);
        listProductType.add(p);
      }
      print(listProductType[0].name);
    } catch (e) {
      print(e.toString());
    }
    return listProductType;
  }
}

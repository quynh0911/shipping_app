import 'package:dio/dio.dart';

import 'package:flutter_application/constances/network.dart';
import 'package:flutter_application/data/sharedpref/shared_preferences_helper.dart';
import 'package:flutter_application/models/store.dart';

class StoreApi {
  Future createStore(ProductStore productStore) async {
    Dio _dio = new Dio();
    SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper();
    try {
      print("** Requets **");
      print("get token");
      var token = await _sharedPreferenceHelper.authToken;
      print("token : $token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      print("Create request to create store");
      var data = productStore.toJson();
      print(data);
      var res =
          await _dio.post(Endpoints.storeInfo, options: options, data: data);
      if (res.statusCode == 201) {
        print("Tạo cửa hàng thành công");
      } else {
        print("Tạo cửa hàng thất bại");
      }
    } catch (e) {
      print("Loi");
      print(e.toString());
    }
  }

  Future<List<ProductStore>> getAllStore() async {
    List<ProductStore> listStore = [];
    Dio _dio = new Dio();
    SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper();
    try {
      print("** Request get listStore **");
      print("get token");
      var token = await _sharedPreferenceHelper.authToken;
      print("token : $token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      print("Create request get");
      var res = await _dio.get(Endpoints.storeInfo, options: options);
      if (res.statusCode == 200) {
        print(res.data);
        for (var store in res.data) {
          ProductStore s = ProductStore.fromJson(store);
          listStore.add(s);
        }
      }
    } catch (e) {}
    return listStore;
  }
}

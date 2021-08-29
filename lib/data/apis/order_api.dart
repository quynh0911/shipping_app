import 'package:dio/dio.dart';
import 'package:flutter_application/constances/network.dart';
import 'package:flutter_application/data/dio/dio_client.dart';
import 'package:flutter_application/data/sharedpref/shared_preferences_helper.dart';
import 'package:flutter_application/models/order.dart';

class OrderAPI {
  Future<int> postOrder(Order order) async {
    DioClient _dioClient = DioClient();
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    try {
      final token =
          'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTYzMjQwNjMxN30.x_tzHAXa7BmSFg56GTJIe6o7AjOZTJk0lr5XUfrvUP4oiuBDigKstzdeTM2UBymlci11kAdy4-OPUa4LMHNkCQ'; //await _sharedPrefsHelper.authToken;
      print(token);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var data = order.toJson();
      print(data.toString());
      var res =
          await _dioClient.post(Endpoints.order, data: data, options: options);

      if (res.statusCode == 201) {
        print('Post order successfully');
      }
      return res.statusCode;
    } catch (e) {
      print(e.toString());
    }
    return 0;
  }

  Future<List<Order>> getOrders() async {
    throw (Exception);
  }
}

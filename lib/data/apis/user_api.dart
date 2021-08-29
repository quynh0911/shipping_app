import 'package:dio/dio.dart';
import 'package:flutter_application/constances/network.dart';
import 'package:flutter_application/data/dio/dio_client.dart';
import 'package:flutter_application/data/sharedpref/shared_preferences_helper.dart';
import 'package:flutter_application/models/user.dart';

class UserApi {
  login(String phone, String password) async {
    print("Đăng nhập");
    try {
      Dio _dioClient = Dio();
      SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
      var res = await _dioClient.post(
        Endpoints.userLoginUrl,
        data: {"username": phone, "password": password, "rememberMe": true},
      );
      if (res.statusCode == 200) {
        await _sharedPrefsHelper.saveAuthToken(res.data["id_token"]);
        print("Tài khoản, mật khẩu chính xác");
      } else
        print("Tài khoản hoặc mật khẩu không đúng");
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
  }

  Future<User?> getUserInfo() async {
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    try {
      print("Get user info");
      final token = await _sharedPrefsHelper.authToken;
      print(token);
      var baseOption = BaseOptions(
        baseUrl: Endpoints.userInfo,
        headers: {'Authorization': 'Bearer $token'},
        connectTimeout: 10000,
        receiveTimeout: 10000,
      );
      Dio _dioClient = Dio(baseOption);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      var res = await _dioClient.get(Endpoints.userInfo, options: options);
      print(res.statusCode);
      print(res.data);
      User user = User.fromJson(res.data);
      _sharedPrefsHelper.saveUser(user);
      return user;
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
  }

//để tạm thành listUser
  Future getListShipper(int page, int size) async {
    print("Bắt đầu lấy danh sách shipper");
    List<User> listShipper = [];
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    Map<String, int> query = {"page": page, "size": size};
    try {
      final token = await _sharedPrefsHelper.authToken;
      print(token);
      var baseOption = BaseOptions(
        baseUrl: Endpoints.adminShipper,
        headers: {'Authorization': 'Bearer $token'},
        connectTimeout: 10000,
        receiveTimeout: 60000,
      );
      Dio _dio = Dio(baseOption);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      var res = await _dio.get(Endpoints.adminShipper,
          queryParameters: query, options: options);
      if (res.statusCode == 200) {
        print(res.data);
        print("Lấy danh sách shipper từ page: " +
            page.toString() +
            " với size: " +
            size.toString() +
            " thành công.");
        for (var i in res.data) {
          User u = User.fromJson(i);
          listShipper.add(u);
        }
      } else if (res.statusCode == 401) {
        print("Lấy danh sách thất bại");
      }
      return listShipper;
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
  }

  Future post(User user) async {
    DioClient _dioClient = DioClient();
    var data = user.toJson();
    print(data);
    try {
      print("Request to register");
      var res = await _dioClient.post(Endpoints.registerUrl, data: data);
      if (res.statusCode == 201) print("Thành công đăng ký role user");
      return res;
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
  }

  Future getListUser(int page, int size) async {
    DioClient _dioClient = DioClient();
    List<User> listUser = [];
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    Map<String, int> query = {"page": page, "size": size};
    try {
      final token = await _sharedPrefsHelper.authToken;
      print(token);
      print("Lấy danh sách user từ page: " +
          page.toString() +
          " với size: " +
          size.toString());
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await _dioClient.post(Endpoints.adminUser,
          queryParameters: query, options: options);
      if (res.statusCode == 200) {
        print("Lấy danh sách user từ page: " +
            page.toString() +
            " với size: " +
            size.toString() +
            " thành công.");
        for (var i in res.data) {
          User s = User.fromJson(i);
          listUser.add(s);
        }
      }

      return listUser;
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
  }

  Future admin_post(User user) async {
    DioClient _dioClient = DioClient();
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    var data = user.toJson();
    try {
      final token = await _sharedPrefsHelper.authToken;
      print(token);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await _dioClient.post(Endpoints.adminUser,
          data: data, options: options);
      if (res.statusCode == 201)
        print("Admin tạo tài khoản: " + user.toJson().toString());
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
  }

  Future updateAvatar(User user) async {
    Dio _dio = Dio();
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;

    try {
      var data = user.toJson();

      final token = await _sharedPrefsHelper.authToken;
      print(token);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res =
          await _dio.put(Endpoints.userInfo, data: data, options: options);
      if (res.statusCode == 200) print("Thành công up dât role user");
      return res;
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
  }

  Future updateUser(User user) async {
    Dio _dio = Dio();
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;

    try {
      var data = user.toJson();

      final token = await _sharedPrefsHelper.authToken;
      print(token);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res =
          await _dio.put(Endpoints.registerUrl, data: data, options: options);
      if (res.statusCode == 200) print("Thành công đăng ký role user");
      return res;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  Future changePassword(String oldPassword, String password) async {
    DioClient _dioClient = DioClient();
    try {
      await _dioClient.put(Endpoints.userChangePasswordUrl,
          data: {"oldPassword": oldPassword, "password": password});
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
  }

  Future deleteUser(String login) async {
    Dio _dio = Dio();
    SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    try {
      final token = await _sharedPrefsHelper.authToken;
      print(token);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      String url = Endpoints.adminUser + "/$login";
      print(url);
      var res = await _dio.delete(url, options: options);
      if (res.statusCode == 200) print("Xoá shipper có $login");
      return res;
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
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_application/data/apis/user_api.dart';
import 'package:flutter_application/models/user.dart';

class ShipperProvider extends ChangeNotifier {
  List<User> shipperList = [];

  void fetchData(int page, int size) async {
    UserApi _userApi = UserApi();
    var res = await _userApi.getListShipper(page, size);
  }
}

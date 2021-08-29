import 'package:flutter/foundation.dart';
import 'package:flutter_application/data/apis/store_api.dart';
import 'package:flutter_application/models/store.dart';

class StateStoreProvider extends ChangeNotifier {
  List<ProductStore> listStore = [];
  void fetchListStore() async {
    StoreApi storeApi = StoreApi();
    listStore = await storeApi.getAllStore();
    // notifyListeners();
  }
}

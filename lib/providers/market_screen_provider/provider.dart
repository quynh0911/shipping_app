import 'package:flutter_application/models/item.dart';

import '../../../../models/item.dart';

import 'package:flutter/material.dart';

class UpdateCartListProvider extends ChangeNotifier {
  List<Items> _cartList = [];
  int deliver = 0;

  void fetch() {}
  List<Items> get cartList => _cartList.toList();

  Items cartItem(int id) {
    List<Items> tmpList =
        _cartList.where((element) => element.id == id).toList();
    return tmpList[0];
  }

  int getAmount(int id) {
    List<Items> tmpList =
        _cartList.where((element) => element.id == id).toList();
    return tmpList[0].amount;
  }

  void removeCartItem(Items cartItem) {
    if (_cartList != null) _cartList.remove(cartItem);

    notifyListeners();
  }

  void addCartItem(Items cartItem) {
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].id == cartItem.id) {
        _cartList[i].amount = _cartList[i].amount + 1;
        notifyListeners();
        return;
      }
    }
    _cartList.add(cartItem);
    notifyListeners();
  }

  void addButton(int id) {
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].id == id) {
        _cartList[i].amount = _cartList[i].amount + 1;
        break;
      }
    }
    notifyListeners();
  }

  void subButton(int id) {
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].id == id && _cartList[i].amount != 0) {
        _cartList[i].amount = _cartList[i].amount - 1;
        break;
      }
    }
    notifyListeners();
  }

  void addText(int id, String text) {
    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].id == id) {
        if (text != '') {
          _cartList[i].amount = int.parse(text);
        } else {
          _cartList[i].amount = 0;
        }
        break;
      }
    }
    notifyListeners();
  }

  int totalBill() {
    if (_cartList.isEmpty) {
      return 0;
    } else {
      int sum = 0;
      _cartList.forEach((element) {
        sum += element.price * (element.amount);
      });
      return sum;
    }
  }

  int totalPaid() {
    return totalBill() + deliver;
  }
}

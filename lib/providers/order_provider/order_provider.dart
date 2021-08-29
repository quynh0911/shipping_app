import 'package:flutter/material.dart';
import 'package:flutter_application/data/apis/order_api.dart';
import 'package:flutter_application/data/apis/user_api.dart';
import 'package:flutter_application/models/item.dart';
import 'package:flutter_application/models/order.dart';
import 'package:flutter_application/providers/signup_provider.dart/signup_provider.dart';
import 'package:flutter_application/screens/fakeData.dart';

class OrderProvider extends ChangeNotifier {
  Order? _order;
  List<Order> _listOrder = FAKE_ORDER;
  bool? _creationState = false;

  Order get order => _order as Order;
  bool get creationState => _creationState as bool;
  List<Order> get listOrder => _listOrder;

  Future fetchDataOrder() async {
    _listOrder = await OrderAPI().getOrders();
    notifyListeners();
  }

  Future addNewOrder(
      //List<Items> items, DateTime orderDate, String orderState,
      //String orderType, String receiverAddress, double receiverLatitude,
      //double receiverLongtitude, String receiverName, String receiverPhone, String senderAddress,
      //double senderLatitude, double senderLongtitude, String senderName, String senderPhone, int shipPrice, int totalPrice
      ) async {
    // _order = Order(
    //   items: items,
    //   orderDate: orderDate,
    //   orderState: orderState,
    //   orderType: orderType,
    //   receiverAddress: receiverAddress,
    //   receiverLatitude: receiverLatitude,
    //   receiverLongitude: receiverLongtitude,
    //   receiverName: receiverName,
    //   receiverPhone: receiverPhone,
    //   senderAddress: senderAddress,
    //   senderLatitude: senderLatitude,
    //   senderLongitude: senderLongtitude,
    //   senderName: senderName,
    //   senderPhone: senderPhone,
    //   shipPrice: shipPrice,
    //   totalPrice: totalPrice
    // );

    int statuscode = await OrderAPI().postOrder(FAKE_ORDER[0]);
    notifyListeners();
  }

  List<Order> filterOrder(String type, String status) {
    if (type == 'Tất cả' && status == 'Tất cả') {
      return _listOrder;
    } else if (type == 'Tất cả') {
      return _listOrder
          .where((element) => element.orderState == status)
          .toList();
    } else if (status == 'Tất cả') {
      return _listOrder.where((ele) => ele.orderType == type).toList();
    } else {
      return _listOrder
          .where((ele) => ele.orderType == type && ele.orderState == status)
          .toList();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application/models/item.dart';
import 'package:flutter_application/screens/users/market_bill/local/market_bill.dart';

class MainMarketBill extends StatelessWidget {
  List<Items>? cartList;

  MainMarketBill(this.cartList);

  @override
  Widget build(BuildContext context) {
    return MarketBill(cartList);
  }
}

// main(List<String> args) {
//   runApp(MainMarketBill());
// }

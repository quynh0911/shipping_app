import 'package:flutter/material.dart';
import 'package:flutter_application/screens/shipper/orders/market_bill/local/market_bill.dart';

class MainMarketBill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MarketBill();
  }
}

main(List<String> args) {
  runApp(MainMarketBill());
}

import 'package:flutter/material.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/screens/shipper/manage_order/local/orderManager/ordermanager.dart';
import 'package:flutter_application/widgets/history_comp.dart';
import 'package:flutter_application/widgets/ship_order_card.dart';

class ManageOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ManageOrder();
  }
}

class _ManageOrder extends State<ManageOrder> {
  String typeDropDown = "Tất cả";
  String statusDropDown = "Tất cả";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: OrderManager(),
        ),
      ),
    );
  }
}

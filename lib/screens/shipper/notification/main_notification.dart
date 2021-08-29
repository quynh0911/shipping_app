import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/models/order.dart';
import 'package:flutter_application/providers/order_provider/order_provider.dart';
import 'package:flutter_application/screens/shipper/notification/local/notification.dart';

class MainNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      create: (context) => OrderProvider(),
      child: ShipperNotifications(),
    );
  }
}

main(List<String> args) {
  runApp(MainNotification());
}

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/providers/order_provider/order_provider.dart';
import 'package:flutter_application/screens/users/Notifications/local_widget/Notifications.dart';

class StateNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderProvider(),
      child: MyNotifications(),
    );
  }
}

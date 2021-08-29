import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/screens/shipper/home_shipper/local/body.dart';
import 'package:flutter_application/screens/shipper/home_shipper/local/income_table.dart';
import 'package:flutter_application/screens/shipper/manage_order/local/manage_order.dart';
import 'package:flutter_application/screens/shipper/manage_order/main_manage_order.dart';
import 'package:flutter_application/screens/shipper/notification/main_notification.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/my_drawer.dart';
import 'package:flutter_application/widgets/shipper_bottom_bar.dart';
import '../../../../route.dart';
import './date_picker.dart';

class HomeShipper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeShipper();
  }
}

class _HomeShipper extends State<HomeShipper> {
  String _value = "Huyện";
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    User user = User(
        address: "",
        login: "Quỳnh",
        firstName: "Quỳnh",
        lastName: "Phạm Thị Hương",
        email: "qq",
        phone: "0962546690",
        authorities: ["ROLE_SHIPPER"]);

    return MaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.pantanoBlue,
        ),
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Trang chủ'),
            ),
            drawer: MyDrawer(
              user: user,
            ),
            bottomNavigationBar: ShipperBottomBar(),
            body: SafeArea(
              child: TabBarView(
                children: [
                  Body(),
                  MainManageOrder(),
                  MainNotification(),
                ],
              ),
            ),
          ),
        ));
  }
}

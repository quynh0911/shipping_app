import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/screens/users/Notifications/notifications.dart';
import 'package:flutter_application/screens/users/history/history.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/body.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/my_drawer.dart';
import 'package:flutter_application/screens/users/order_screen/ordercart.dart';
import 'package:flutter_application/screens/users/service_screen/service_screen.dart';
import 'package:flutter_application/widgets/user_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  User user = User(
      address: "",
      login: "Quỳnh",
      firstName: "Quỳnh",
      lastName: "Phạm Thị Hương",
      email: "qq",
      phone: "0962546690",
      authorities: ["ROLE_USER"]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.pantanoBlue,
      ),
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Trang chủ",
            ),
          ),
          drawer: MyDrawer(
            user: user,
          ),
          bottomNavigationBar: UserBottomBar(),
          body: TabBarView(
            children: [
              Body(),
              OrderCartStart(),
              HistoryStart(),
              ServiceScreen(),
              StateNotifications(),
            ],
          ),
        ),
      ),
    );
  }
}

main(List<String> args) {
  runApp(HomeScreen());
}

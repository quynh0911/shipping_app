import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/admin/store/local_widget/Store.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/my_drawer.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/screens/shipper/home_shipper/local/body.dart';
import 'package:flutter_application/screens/users/history/history.dart';
import 'package:flutter_application/screens/users/Notifications/notifications.dart';

void main() {
  runApp(ShipperMainframeStart(
    selectedIndex: 0,
  ));
}

class ShipperMainframeStart extends StatefulWidget {
  late int selectedIndex;
  ShipperMainframeStart({
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  _ShipperMainframe createState() => _ShipperMainframe();
}

class _ShipperMainframe extends State<ShipperMainframeStart> {
  static const List<String> userFrames = [
    "Trang chủ",
    "Quản lý đơn",
    "Thông báo",
  ];

  late User user;
  @override
  void initState() {
    super.initState();
    user = User(
        address: "",
        login: "Quỳnh",
        firstName: "Quỳnh",
        lastName: "Phạm Thị Hương",
        email: "qq",
        phone: "0962546690",
        authorities: ["ROLE_USER"]);
    getUser();
  }

  void getUser() async {
    final SharedPreferences _sharedPreference =
        await SharedPreferences.getInstance();
    user.firstName = _sharedPreference.getString("firstName")!;
    user.lastName = _sharedPreference.getString("lastName")!;
    user.phone = _sharedPreference.getString("phone")!;
    user.email = _sharedPreference.getString("email")!;
    user.avatar = _sharedPreference.getString("avatar");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            centerTitle: true,
            backgroundColor: AppColors.blue,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back_ios_outlined),
            //   color: AppColors.yellow,
            //   onPressed: () => Navigator.pop(context),
            // ),
            title: new Text(
              userFrames.elementAt(widget.selectedIndex),
              style: TextStyle(
                color: AppColors.yellow,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          drawer: MyDrawer(user: user),
          bottomNavigationBar: buildBottomNavigation(context),
          // body: TabBarView(
          //   children: [
          //     Body(),
          //     OrderCartStart(),
          //     HistoryStart(),
          //     ServiceScreen(),
          //     StateNotifications(),
          //   ],
          // ),
          body: widget.selectedIndex == 0
              ? Body()
              : widget.selectedIndex == 1
                  ? HistoryStart()
                  : StateNotifications(),
        ),
      ),
    );
  }

  Widget buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.content_paste),
          label: 'Q.lý đơn',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'Thông báo'),
      ],
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.gray,
      unselectedLabelStyle: TextStyle(color: AppColors.gray),
      unselectedFontSize: 10,
      selectedFontSize: 10,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.selectedIndex,
      onTap: (index) => setState(() {
        widget.selectedIndex = index;
      }),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/providers/shipper_provider.dart/shipper_provider.dart';
import 'package:flutter_application/screens/admin/store/local_widget/Store.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/my_drawer.dart';
import 'package:flutter_application/screens/admin/shipper/select_shipper.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/body.dart';
import 'package:flutter_application/screens/users/history/history.dart';
import 'package:flutter_application/screens/users/Notifications/notifications.dart';

void main() {
  runApp(AdminMainframeStart(
    selectedIndex: 0,
  ));
}

class AdminMainframeStart extends StatefulWidget {
  late int selectedIndex;
  AdminMainframeStart({
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  _AdminMainframe createState() => _AdminMainframe();
}

class _AdminMainframe extends State<AdminMainframeStart> {
  static const List<String> userFrames = [
    "Trang chủ",
    "Cửa hàng",
    "Q.lý đơn",
    "Chat",
    "Shipper",
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
    user.avatar = _sharedPreference.getString("avatar");
    user.email = _sharedPreference.getString("email")!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            centerTitle: true,
            backgroundColor: AppColors.blue,
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
          body: widget.selectedIndex == 0
              ? Body()
              : widget.selectedIndex == 1
                  ? StateStore()
                  : widget.selectedIndex == 2
                      ? HistoryStart()
                      : widget.selectedIndex == 3
                          ? Center(
                              child: Text("Chat sẽ được update sau"),
                            )
                          : widget.selectedIndex == 4
                              ? ShipperSelectState()
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
          icon: Icon(Icons.store_mall_directory),
          label: 'Cửa hàng',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.content_paste),
          label: 'Q.lý đơn',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble_text,
            ),
            label: 'Chat'),
        BottomNavigationBarItem(
          icon: Icon(Icons.delivery_dining),
          label: 'Shipper',
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

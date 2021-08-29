import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';

class AdminBottomBar extends StatefulWidget {
  @override
  _AdminBottomBarState createState() => _AdminBottomBarState();
}

class _AdminBottomBarState extends State<AdminBottomBar> {
  int _selectedIndex = 1;
  static const List<Widget> _pages = <Widget>[
    Center(
      child: Text("test 1"),
    ),
    Center(
      child: Text("test 2"),
    ),
    Center(
      child: Text("Test 3"),
    ),
    Center(
      child: Text("Test 4"),
    ),
    Center(
      child: Text("Test 5"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory), label: 'Cửa hàng'),
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
          icon: Icon(Icons.delivery_dining_rounded),
          label: "Shipper",
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
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

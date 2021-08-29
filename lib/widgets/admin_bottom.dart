import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdminBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        unselectedLabelColor: Colors.grey,
        indicatorWeight: 6.0,
        indicator: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.blue)),
        ),
        indicatorPadding: EdgeInsets.only(left: 0, right: 0),
        labelColor: Colors.blueAccent,
        isScrollable: true,
        tabs: [
          Tab(
            icon: Icon(
              Icons.home,
            ),
            text: "Home",
          ),
          Tab(
            icon: Icon(Icons.store_mall_directory),
            text: "Cửa hàng",
          ),
          Tab(
            icon: Icon(Icons.content_paste_rounded),
            text: "QL đơn",
          ),
          Tab(
            icon: Icon(CupertinoIcons.chat_bubble_text),
            text: "Chat",
          ),
          Tab(
            icon: Icon(Icons.delivery_dining_rounded),
            text: "Shipper",
          ),
          Tab(
            icon: Icon(Icons.notifications),
            text: "Thông báo",
          ),
        ],
      ),
    );
  }
}

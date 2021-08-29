import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';

class ShipperBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          indicatorWeight: 6.0,
          indicator: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.blue))),
          indicatorPadding: EdgeInsets.only(left: 0, right: 0),
          labelColor: AppColors.blue,
          isScrollable: false,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
              ),
              text: "Trang chủ",
            ),
            Tab(
              icon: Icon(Icons.content_paste),
              text: 'Q.lý đơn',
            ),
            Tab(
                icon: Icon(
                  Icons.notifications,
                ),
                text: 'Thông báo'),
          ],
        ));
  }
}

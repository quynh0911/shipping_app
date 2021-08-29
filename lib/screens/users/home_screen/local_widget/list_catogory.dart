import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
//import 'package:flutter_application/screens/users/PlaceOrder/Place_Order.dart';
import 'package:flutter_application/screens/users/PlaceOrder/local_widget/Place_Order.dart';
//import 'package:flutter_application/screens/users/SeeLaundry/See_laundry.dart';
import 'package:flutter_application/screens/users/SeeLaundry/local_widget/See_laundry.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/catogory.dart';
import 'package:flutter_application/screens/users/market/main_market.dart';
import 'package:flutter_application/screens/users/market_bill/main_market_bill.dart';
import 'package:flutter_application/screens/users/search_screen/search_screen.dart';

class ListCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchStart()),
            );
          },
          child: Catogory(
            color: AppColors.orange,
            name: "Đồ ăn",
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchStart()),
            );
          },
          child: Catogory(
            color: AppColors.yellow,
            name: "Đồ uống",
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PlaceOrder()));
          },
          child: Catogory(
            color: AppColors.green,
            name: "Đặt ship",
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MainMarket()));
          },
          child: Catogory(
            color: AppColors.sky,
            name: "Đi chợ",
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SeeLaundry()));
          },
          child: Catogory(
            color: AppColors.pink,
            name: "Giặt là",
          ),
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/users/PlaceOrder/local_widget/Place_Order.dart';
import 'package:flutter_application/screens/users/SeeLaundry/local_widget/See_laundry.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/catogory.dart';
import 'package:flutter_application/screens/users/market/main_market.dart';

class ServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PlaceOrder()));
                  },
                  child: Catogory(
                    color: Colors.blue.shade300,
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
                    color: Colors.blue.shade700,
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
                    color: Colors.pink.shade300,
                    name: "Giặt là",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_application/screens/users/order_screen/order.dart';
import 'package:flutter_application/widgets/history_comp.dart';
import 'package:flutter_application/widgets/food_item.dart';
import 'package:flutter_application/widgets/ship_order_card.dart';
import 'package:flutter_application/models/order.dart';

class OrderHistory extends StatefulWidget {
  OrderHistory({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 500) ? 500 : screenWidth;

    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OrderStart(
                          listItem: widget.order.items,
                          totalprice: widget.order.totalPrice,
                          viewOrder: true,
                        )));
          },
          child: Container(
            margin: screenWidth > 400
                ? EdgeInsets.only(
                    left: cardWidth * 1 / 20, right: cardWidth * 1 / 20)
                : EdgeInsets.only(
                    left: cardWidth * 1 / 40, right: cardWidth * 1 / 40),
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: (widget.order.orderType == "Đơn hàng" ||
                        widget.order.orderType == "Đi chợ")
                    ? Row(
                        children: [
                          for (var item in widget.order.items)
                            FoodItem(
                                linkavatar: "",
                                name: item.name,
                                type: "",
                                money: item.price,
                                add: false),
                        ],
                      )
                    : widget.order.orderType == "Đơn ship"
                        ? ShipOrderCard(
                            description:
                                "Nam quốc sơn hà nam đế cư,\nTiệt nhiên định phận tại thiên thư.\nNhư hà nghịch lỗ lai xâm phạm,\nNhữ đẳng hành khan thủ bại hư.",
                            deadline: "Trước 13h ngày 08/08/2021",
                            type: "Đồ muốn chuyển")
                        : widget.order.orderType == "Giặt là"
                            ? ShipOrderCard(
                                description:
                                    "Nam quốc sơn hà nam đế cư,\nTiệt nhiên định phận tại thiên thư.\nNhư hà nghịch lỗ lai xâm phạm,\nNhữ đẳng hành khan thủ bại hư.",
                                deadline: "Trước 13h ngày 08/08/2021",
                                type: "Đồ mang đi giặt")
                            : Container()),
          ),
        ),
        StateFullHistory(type: widget.order.orderType, order: widget.order),
      ],
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/screens/users/history/history.dart';
import 'package:flutter_application/screens/users/order_screen/local_widgets/item_in_cart.dart';
//import 'package:flutter_application/screens/users/history/history.dart';
import 'package:flutter_application/widgets/customer_card.dart';
import 'local_widgets/radio_button.dart';
import 'package:flutter_application/models/item.dart';
import 'package:flutter_application/models/order.dart';
import 'package:flutter_application/models/user.dart';

class OrderStart extends StatelessWidget {
  // This widget is the root of your application.
  OrderStart(
      {Key? key,
      required this.listItem,
      required this.totalprice,
      required this.viewOrder})
      : super(key: key);

  final List<Items> listItem;
  final int totalprice;
  final bool viewOrder;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đặt hàng',
      debugShowCheckedModeBanner: false,
      home: OrderState(
          title: 'Đặt hàng',
          listItem: listItem,
          totalprice: totalprice,
          view: viewOrder),
    );
  }
}

class OrderState extends StatefulWidget {
  OrderState(
      {Key? key,
      required this.title,
      required this.listItem,
      required this.totalprice,
      required this.view})
      : super(key: key);

  final String title;
  final List<Items> listItem;
  final int totalprice;
  final bool view;

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrderState> {
  static int shipFee = 30000;
  static int totalPayment = 0;
  static bool readyOrder = true;

  @override
  Widget build(BuildContext context) {
    totalPayment = shipFee + widget.totalprice;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Color.fromRGBO(29, 67, 155, 1),
      //   leading: Icon(
      //     Icons.arrow_back_ios_outlined,
      //     color: Color.fromRGBO(255, 240, 0, 1),

      //   ),
      //   title: new Text(
      //     widget.title,
      //     style: TextStyle(
      //       color: Color.fromRGBO(255, 240, 0, 1),
      //       fontSize: 28,
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: screenWidth > 400
                  ? EdgeInsets.only(top: 20, left: cardWidth * 1 / 20)
                  : EdgeInsets.only(top: 20, left: cardWidth * 1 / 40),
              child: Text(
                "Bao gồm:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              margin: screenWidth > 400
                  ? EdgeInsets.only(
                      top: 20,
                      left: cardWidth * 1 / 20,
                      right: cardWidth * 1 / 20)
                  : EdgeInsets.only(
                      top: 20,
                      left: cardWidth * 1 / 40,
                      right: cardWidth * 1 / 40),
              constraints: BoxConstraints(
                maxWidth: 600,
                maxHeight: 260,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    for (var item in widget.listItem)
                      new ItemInCart(
                          linkavatar: item.name,
                          name: item.name,
                          type: item.name,
                          money: item.price,
                          amount: item.amount,
                          order: true,
                          add: false),
                  ],
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    margin: screenWidth > 400
                        ? EdgeInsets.only(top: 20, left: cardWidth * 1 / 20)
                        : EdgeInsets.only(top: 20, left: cardWidth * 1 / 40),
                    child: Text(
                      "Tổng tiền hàng:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: screenWidth > 400
                        ? EdgeInsets.only(top: 20, right: cardWidth * 1 / 20)
                        : EdgeInsets.only(top: 20, right: cardWidth * 1 / 40),
                    child: Text(
                      widget.totalprice.toString() + " VNĐ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: screenWidth > 400
                    ? EdgeInsets.only(
                        top: 20, left: cardWidth * 1 / 20, bottom: 20)
                    : EdgeInsets.only(
                        top: 20, left: cardWidth * 1 / 40, bottom: 20),
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                child: Row(
                  children: [
                    Text(
                      "Địa chỉ nhận hàng:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                )),
            CustomerCard(
                linkavatar: "assets/images/tra_chanh.jpg",
                name: "Nghiêm Nghiêm Nghiêm Nghiêm",
                phonenumber: "0987654321",
                address: "Thanh Nhàn, Hai Bà Trưng, Hà Nội"),
            Container(
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    margin: screenWidth > 400
                        ? EdgeInsets.only(top: 20, left: cardWidth * 1 / 20)
                        : EdgeInsets.only(top: 20, left: cardWidth * 1 / 40),
                    child: Text(
                      "Phí vận chuyển:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: screenWidth > 400
                        ? EdgeInsets.only(top: 20, right: cardWidth * 1 / 20)
                        : EdgeInsets.only(top: 20, right: cardWidth * 1 / 40),
                    child: Text(
                      shipFee.toString() + " VNĐ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    margin: screenWidth > 400
                        ? EdgeInsets.only(top: 20, left: cardWidth * 1 / 20)
                        : EdgeInsets.only(top: 20, left: cardWidth * 1 / 40),
                    child: Text(
                      "Tống thanh toán:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: screenWidth > 400
                        ? EdgeInsets.only(top: 20, right: cardWidth * 1 / 20)
                        : EdgeInsets.only(top: 20, right: cardWidth * 1 / 40),
                    child: Text(
                      totalPayment.toString() + " VNĐ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(9, 57, 180, 1),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              alignment: Alignment.center,
              child: RadioButton(),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Lưu Order vào Database
                  if (widget.view == false)
                    // Order order = new Order(
                    //     orderDate: DateTime.now(),
                    //     shipPrice: shipFee,
                    //     totalPrice: totalPayment,

                    //     items: [
                    //       for (var item in widget.listItem)
                    //         if (item.amount! > 0) item,
                    //     ]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HistoryStart()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      readyOrder == true
                          ? Color.fromRGBO(9, 57, 180, 1)
                          : Color.fromRGBO(135, 123, 123, 0.3),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 32.0, right: 32.0),
                  child: Text(
                    widget.view == false ? "Đặt hàng" : "OK",
                    style: TextStyle(
                      color: readyOrder == true
                          ? Color.fromRGBO(255, 240, 0, 1)
                          : Color.fromRGBO(135, 123, 123, 0.7),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

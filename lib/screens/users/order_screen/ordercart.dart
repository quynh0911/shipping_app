import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/models/item.dart';
import 'package:flutter_application/screens/users/order_screen/order.dart';
import 'package:flutter_application/widgets/food_item.dart';
import 'package:flutter_application/screens/fakeData.dart';

class OrderCartStart extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giỏ hàng',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: OrderCart(title: 'Giỏ hàng'),
    );
  }
}

class OrderCart extends StatefulWidget {
  OrderCart({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _OrderCartState createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  static int totalprice = 0;

  // Fake Data
  static late ProductStore store = FAKE_STORE.first;
  static late List<Product> listProduct = FAKE_PRODUCT_MARKET;
  static List<Items> listItem = FAKE_CART_LIST;

  @override
  Widget build(BuildContext context) {
    totalprice = 0;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 500) ? 500 : screenWidth;

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
                maxWidth: 500,
                maxHeight: 330,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    for (var item in listItem) buildItem(context, item, false),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                constraints: BoxConstraints(
                  maxWidth: 500,
                ),
                child: Row(
                  children: [
                    Text(
                      "Thêm món:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                )),
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
                maxWidth: 500,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (var item in listProduct)
                      if (1 == 1) buildProduct(context, item, true),
                  ],
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
                      totalprice.toString() + " VNĐ",
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
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // runApp(OrderStart());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => OrderStart(
                                listItem: [],
                                totalprice: totalprice,
                                viewOrder: false,
                              )));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(9, 57, 180, 1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                child: Container(
                  padding: EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 32.0, right: 32.0),
                  child: Text(
                    "Đặt hàng",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 240, 0, 1),
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

  Widget buildItem(BuildContext context, Items item, bool order) {
    totalprice += item.price * item.amount;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    return Container(
      margin: (screenWidth > 360)
          ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
          : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      constraints: BoxConstraints(
        maxWidth: 600,
      ),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 40,
                child: order == false
                    ? IconButton(
                        icon: Icon(Icons.add_circle_outline,
                            color: Color.fromRGBO(9, 57, 180, 1)),
                        onPressed: () {
                          item.amount = (item.amount + 1);
                          setState(() {});
                        },
                      )
                    : Container(),
              ),
              Text(
                item.amount.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
                width: 40,
                child: order == false
                    ? IconButton(
                        icon: Icon(Icons.remove_circle_outline,
                            color: Color.fromRGBO(9, 57, 180, 1)),
                        onPressed: () {
                          int x = item.amount;
                          x = x > 0 ? --x : 0;
                          item.amount = x;
                          setState(() {});
                        },
                      )
                    : Container(),
              ),
            ],
          ),
          Text(
            screenWidth > 360 ? "   x   " : "  x  ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          new FoodItem(
              linkavatar: "",
              name: item.name,
              type: "",
              money: item.price,
              add: false),
        ],
      ),
    );
  }

  Widget buildProduct(BuildContext context, Product product, bool add) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      width: screenWidth > 400 ? 250 : cardWidth * 6 / 10,
      height: 110,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(9, 57, 180, 1), width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                child: Image.asset(
                  product.image!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                  child: Container(
                margin: (screenWidth > 360)
                    ? EdgeInsets.only(left: 5.0, right: 5.0, top: 0.0)
                    : EdgeInsets.only(left: 0, right: 0, top: 0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 120,
                            child: Text(
                              product.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                height: 2,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.indeterminate_check_box,
                            color: Color.fromRGBO(255, 139, 102, 1),
                            size: 12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            product.types.first.name,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(
                                left: 10, top: 6, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(9, 57, 180, 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              product.price.toString(),
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          if (add == true)
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: Color.fromRGBO(9, 57, 180, 1),
                                ),
                                onPressed: () {
                                  listItem.add(new Items(
                                      id: product.id!,
                                      name: product.name,
                                      price: product.price,
                                      amount: 1));
                                  listProduct.remove(product);
                                  setState(() {});
                                },
                              ),
                            ),
                        ],
                      ),
                    ]),
              )),
            ]),
      ),
    );
  }
}

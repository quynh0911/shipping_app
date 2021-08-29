import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_application/models/item.dart';
import 'package:flutter_application/models/order.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/widgets/Infor_ship.dart';
import 'package:flutter_application/widgets/food_item.dart';
import 'package:flutter_application/widgets/market_item.dart';

//import 'models/product.dart';

//import '../fakeData.dart';

class Management_Market extends StatefulWidget {
  Management_Market({
    Key? key,
  }) : super(key: key);
  @override
  _ManagementState createState() => _ManagementState();
}

class _ManagementState extends State<Management_Market> {
  // List<Order> listOrder = FAKE_ORDER;
  static List<Product> listProduct = FAKE_PRODUCT_MARKET;
  static List<Items> listItem = FAKE_CART_LIST;
  String typeDropDown = "Tất cả";
  String statusDropDown = "Tất cả";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  void delete() {}
  void watch() {}

  _startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != startDate)
      setState(() {
        startDate = picked;
      });
  }

  _endDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != endDate)
      setState(() {
        endDate = picked;
      });
  }

  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 500) ? 500 : screenWidth;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quản Lý Đơn'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
              width: cardWidth * 1.0,
              height: 80,
              child: Column(
                children: [
                  Row(children: [
                    Text(
                      "Loại: ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(135, 123, 123, 1),
                      ),
                    ),
                    Container(
                      height: 22,
                      padding: EdgeInsets.only(left: 1.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(9, 57, 180, 1), width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: DropdownButton<String>(
                        value: typeDropDown,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 22,
                        elevation: 8,
                        underline: Container(
                          height: 1,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            typeDropDown = newValue!;
                          });
                        },
                        items: orderTypes
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              " " + value,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Trạng thái: ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(135, 123, 123, 1),
                      ),
                    ),
                    Container(
                      height: 22,
                      padding: EdgeInsets.only(left: 1.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(9, 57, 180, 1), width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: DropdownButton<String>(
                        value: statusDropDown,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 22,
                        elevation: 8,
                        underline: Container(
                          height: 1,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            statusDropDown = newValue!;
                          });
                        },
                        items: orderState
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              " " + value,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Từ ngày: ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(135, 123, 123, 1),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _startDate(context),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(135, 123, 123, 0.3))),
                        child: Container(
                          width: 64,
                          height: 16,
                          alignment: Alignment.center,
                          child: Text(
                            "${startDate.toLocal().day}" +
                                "/" +
                                "${startDate.toLocal().month}" +
                                "/" +
                                "${startDate.toLocal().year}",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Đến ngày: ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(135, 123, 123, 1),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _endDate(context),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(135, 123, 123, 0.3))),
                        child: Container(
                          width: 64,
                          height: 16,
                          alignment: Alignment.center,
                          child: Text(
                            "${endDate.toLocal().day}" +
                                "/" +
                                "${endDate.toLocal().month}" +
                                "/" +
                                "${endDate.toLocal().year}",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              //padding: EdgeInsets.all(),
              constraints: BoxConstraints(
                maxHeight: 400,
                maxWidth: 600,
              ),
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(width: 2, color: AppColors.pantanoBlue),
                bottom: BorderSide(width: 2, color: AppColors.pantanoBlue),
              )),
              child: Column(
                children: [
                  Container(
                    margin: screenWidth > 400
                        ? EdgeInsets.only(
                            top: 10, left: 10, right: cardWidth * 1 / 20)
                        : EdgeInsets.only(
                            top: 10, left: 10, right: cardWidth * 1 / 40),
                    constraints: BoxConstraints(
                      maxWidth: 500,
                      maxHeight: 80,
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        MarketItem(
                            name: 'Thịt bò',
                            image: 'assets/images/tao_pho.jpg',
                            price: 30000),
                        MarketItem(
                            name: 'Thịt bò',
                            image: 'assets/images/tao_pho.jpg',
                            price: 30000),
                        MarketItem(
                            name: 'Thịt bò',
                            image: 'assets/images/tao_pho.jpg',
                            price: 30000),
                      ],
                    ),
                  ),
                  Spacer(),
                  InforShip(
                      numberFood: '3',
                      money: '330000',
                      status: 'đang giao',
                      time: '12h ngày xx',
                      customer: 'Ngô Đình Sáng',
                      phone: '0987654321',
                      address: 'Hà Nội',
                      shippingFee: '30000',
                      watch: watch,
                      delete: delete),
                ],
              ),
            ),
          ],
        ),
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
                  'assets/images/tra_chanh.jpg',
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
                                      amount: 1,
                                      id: 1,
                                      price: 3000,
                                      name: 'tra chanh'));
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

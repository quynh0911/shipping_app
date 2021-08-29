import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/screens/users/search_screen/local_widget/product_information.dart';
import 'package:flutter_application/screens/users/search_screen/local_widget/store_information.dart';
import 'package:flutter_application/screens/users/search_screen/local_widget/comment_widget.dart';

class ViewProductStart extends StatelessWidget {
  late Product product;

  ViewProductStart({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: AppColors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            color: AppColors.yellow,
            onPressed: () => Navigator.pop(context),
          ),
          title: new Text(
            "Xem món",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: ViewProductState(
          product: this.product,
        ),
      ),
    );
  }
}

class ViewProductState extends StatefulWidget {
  late Product product;

  ViewProductState({Key? key, required this.product}) : super(key: key);

  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProductState> {
  int amount = 1;

  @override
  static late List<Product> listProduct = FAKE_PRODUCT_MARKET;
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 0.9;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 0.95;
    else
      boundWidth = screenWidth * 0.7;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
            top: 10 + paddingWidth / 10,
            bottom: 10 + paddingWidth / 10,
            left: paddingWidth,
            right: paddingWidth),
        child: Column(
          children: [
            ProductInformation(product: widget.product),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: boundWidth / 10,
                    width: boundWidth / 10,
                    child: IconButton(
                      icon: Icon(Icons.remove_circle_outline,
                          color: Color.fromRGBO(9, 57, 180, 1)),
                      onPressed: () {
                        setState(() {
                          amount = amount > 1 ? --amount : 1;
                        });
                      },
                    )),
                Text(
                  amount.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: boundWidth / 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: boundWidth / 10,
                    width: boundWidth / 10,
                    child: IconButton(
                      icon: Icon(Icons.add_circle_outline,
                          color: Color.fromRGBO(9, 57, 180, 1)),
                      onPressed: () {
                        setState(() {
                          ++amount;
                        });
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(
                    top: 10 + paddingWidth / 10,
                    bottom: 10 + paddingWidth / 10,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: widget.product.actived == true
                            ? AppColors.blue
                            : AppColors.gray,
                        side: BorderSide(
                            color: widget.product.actived == true
                                ? AppColors.blue
                                : AppColors.gray,
                            width: 2),
                        padding: EdgeInsets.only(
                            left: 20.0 + paddingWidth / 20,
                            right: 20.0 + paddingWidth / 20,
                            top: 5.0 + paddingWidth / 20,
                            bottom: 5.0 + paddingWidth / 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(boundWidth / 50)))),
                    child: Text(
                      "Đặt hàng",
                      style: TextStyle(
                        color: widget.product.actived == true
                            ? Colors.white
                            : AppColors.brown,
                        fontSize: boundWidth / 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                        ),
                      ),
                      StoreInformation(productStore: widget.product.store!),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                        ),
                      ),
                      Comment(),
                      Comment(),
                      Comment(),
                    ],
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

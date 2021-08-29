import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/models/district.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/models/product_type.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/list_product.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/searchbox.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/carousel_slide.dart';
import 'package:flutter_application/widgets/product_widget.dart';

import 'list_catogory.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  District district = District(id: 1, name: "String");
  static ProductStore store = ProductStore(
      id: 10,
      district: "",
      name: "GHST",
      latitude: 29,
      longitude: 108,
      openTime: "8h30",
      closeTime: "17h30",
      phone: "0987654321",
      address: "Thanh Nhàn");
  Product product1 = new Product(
      id: 1,
      actived: true,
      imageContentType: "",
      image: "assets/images/tao_pho.jpg",
      description: ".png",
      name: "Cơm",
      price: 30000,
      store: store,
      types: [ProductType(id: 2, name: "Đồ ăn")]);

  Product product2 = new Product(
      id: 2,
      actived: true,
      imageContentType: "",
      image: "assets/images/tao_pho.jpg",
      description: ".png",
      name: "Bún",
      price: 3000000,
      store: store,
      types: [ProductType(id: 3, name: "Đồ uống")]);

  Product product3 = new Product(
      id: 3,
      actived: true,
      imageContentType: "",
      image: "assets/images/tao_pho.jpg",
      description: ".png",
      name: "Phở",
      price: 300000,
      store: store,
      types: [ProductType(id: 3, name: "Đồ uống")]);
  List<Product> listProduct1 = <Product>[];

  @override
  Widget build(BuildContext context) {
    listProduct1.add(product1);
    listProduct1.add(product2);
    listProduct1.add(product3);
    listProduct1.add(product3);
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 9 / 10;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 19 / 20;
    else
      boundWidth = screenWidth * 7 / 10;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: 10 + paddingWidth / 10,
              bottom: 10 + paddingWidth / 10,
              left: paddingWidth,
              right: paddingWidth),
          child: Column(
            children: [
              SearchBar(),
              // Container(
              //     padding: EdgeInsets.only(bottom: 16, top: 8),
              //     width: boundWidth,
              //     child: Image.asset(
              //       "assets/images/banner1.png",
              //       fit: BoxFit.fill,
              //     )),
              CarouselWithIndicatorDemo(),
              ListCategories(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phổ biến",
                    style: TextStyle(
                        color: AppColors.brown,
                        fontSize: boundWidth * 1 / 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Xem thêm",
                      style: TextStyle(
                          color: AppColors.blue,
                          fontSize: boundWidth * 1 / 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: boundWidth / 3,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: listProduct1
                      .map((e) => ProductWidget(product: e))
                      .toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phổ biến",
                    style: TextStyle(
                        color: AppColors.brown,
                        fontSize: boundWidth * 1 / 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Xem thêm",
                      style: TextStyle(
                          color: AppColors.blue,
                          fontSize: boundWidth * 1 / 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: boundWidth / 3,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: listProduct1
                      .map((e) => ProductWidget(product: e))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

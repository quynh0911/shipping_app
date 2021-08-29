import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/data/sharedpref/shared_preferences_helper.dart';
import 'package:flutter_application/models/district.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/models/product_type.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/screens/admin/shipper/select_shipper.dart';
import 'package:flutter_application/screens/admin/store/store.dart';
import 'package:flutter_application/screens/users/Notifications/local_widget/Notifications.dart';
import 'package:flutter_application/screens/users/history/history.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/body.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/list_catogory.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/my_drawer.dart';
import 'package:flutter_application/screens/users/home_screen/local_widget/searchbox.dart';
import 'package:flutter_application/screens/users/Notifications/notifications.dart';
import 'package:flutter_application/screens/users/order_screen/ordercart.dart';
import 'package:flutter_application/screens/users/service_screen/service_screen.dart';
import 'package:flutter_application/widgets/admin_bottom.dart';
import 'package:flutter_application/widgets/admin_bottom_bar.dart';
import 'package:flutter_application/widgets/product_widget.dart';
import 'package:flutter_application/widgets/user_bottom_bar.dart';

class AdminHomeScreen extends StatefulWidget {
  @override
  _AdminHomeScreenState createState() {
    return _AdminHomeScreenState();
  }
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  District district = District(id: 1, name: "String");
  static ProductStore store = ProductStore(
      id: 10,
      district: "",
      name: "GHST",
      latitude: 29,
      longitude: 108,
      openTime: "",
      closeTime: "",
      phone: "0987654321",
      address: "Thanh Nhàn");
  Product product1 = new Product(
      id: 1,
      actived: true,
      imageContentType: "",
      image: "assets/images/tra_chanh.jpg",
      description: ".png",
      name: "Cơm",
      price: 30000,
      store: store,
      types: [ProductType(id: 2, name: "Đồ ăn")]);

  Product product2 = new Product(
      id: 2,
      actived: true,
      imageContentType: "",
      image: "assets/images/tra_chanh.jpg",
      description: ".png",
      name: "Trà chanh",
      price: 30000,
      store: store,
      types: [ProductType(id: 3, name: "Đồ uống")]);

  Product product3 = new Product(
      id: 3,
      actived: true,
      imageContentType: "",
      image: "assets/images/tra_chanh.jpg",
      description: ".png",
      name: "Trà chanh",
      price: 30000,
      store: store,
      types: [ProductType(id: 3, name: "Đồ uống")]);
  List<Product> listProduct1 = <Product>[];
  late User user;

  @override
  void initState() {
    super.initState();
    user = User(
        address: "",
        login: "Quỳnh",
        firstName: "Quỳnh",
        lastName: "Phạm Thị Hương",
        email: "qq",
        phone: "0962546690",
        authorities: ["ROLE_USER"]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.pantanoBlue,
      ),
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Trang chủ",
            ),
          ),
          drawer: MyDrawer(
            user: user,
          ),
          bottomNavigationBar: AdminBottom(),
          body: TabBarView(
            children: [
              Body(),
              Store(),
              HistoryStart(),
              Center(
                child: Text("Test 3"),
              ),
              ShipperSelectStart(),
              StateNotifications(),
            ],
          ),
        ),
      ),
    );
  }
}

main(List<String> args) {
  runApp(AdminHomeScreen());
}

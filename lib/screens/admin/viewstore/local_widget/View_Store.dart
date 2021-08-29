import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/models/product_type.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/screens/admin/viewstore/local_widget/add_new_product_form.dart';
import 'package:flutter_application/screens/admin/viewstore/local_widget/add_new_product.dart';
import 'package:flutter_application/screens/users/search_screen/local_widget/product_information.dart';
import 'package:flutter_application/screens/splash/splash_screen.dart';
import 'package:flutter_application/screens/users/market_bill/main_market_bill.dart';
import 'package:flutter_application/widgets/product_widget.dart';
//import 'package:flutter_application/widgets/store_information.dart';
import 'package:flutter_application/screens/users/search_screen/local_widget/store_information.dart';
import 'package:flutter_application/screens/fakeData.dart';

class ViewStoreStart extends StatelessWidget {
  ProductStore productStore;
  ViewStoreStart({required this.productStore});

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
            "Xem cửa hàng",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: StateViewStore(
          productStore: this.productStore,
        ),
      ),
    );
  }
}

class StateViewStore extends StatefulWidget {
  ProductStore productStore;
  StateViewStore({required this.productStore});
  @override
  _StateViewStore createState() => _StateViewStore();
}

class _StateViewStore extends State<StateViewStore> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  static late List<Product> listProduct = FAKE_PRODUCT_MARKET;
  @override
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

    int? _select = 0;

    final Product product = Product(
        id: 3,
        image: 'assets/images/tao_pho.jpg',
        actived: true,
        description: 'Ngon',
        name: 'Tào phớ',
        price: 10000,
        store: FAKE_STORE[0],
        types: FAKE_PRODUCT_TYPE,
        imageContentType: 'jpg');
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
            top: 10 + paddingWidth / 10,
            bottom: 10 + paddingWidth / 10,
            left: paddingWidth,
            right: paddingWidth),
        child: Column(
          children: [
            StoreInformation(
              productStore: widget.productStore,
            ),
            Container(
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _select = 1;
                    });
                  },
                  child: Text(
                    "Đồ ăn",
                    style: TextStyle(
                      color: _select == 1 ? Colors.black : AppColors.brown,
                      fontSize: boundWidth * 1 / 25,
                      decoration:
                          _select == 1 ? TextDecoration.underline : null,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _select = 2;
                    });
                  },
                  child: Text(
                    "Đồ uống",
                    style: TextStyle(
                      color: _select == 2 ? Colors.black : AppColors.brown,
                      fontSize: boundWidth * 1 / 25,
                      decoration:
                          _select == 2 ? TextDecoration.underline : null,
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
                      for (var item in listProduct)
                        ProductInformation(product: item),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.blue,
              ),
            ),
            Container(
              height: boundWidth / 6,
              alignment: Alignment.center,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: AppColors.blue,
                    backgroundColor: Colors.white,
                    side: BorderSide(color: AppColors.blue, width: 2),
                    padding: EdgeInsets.only(
                        left: 10.0 + paddingWidth / 20,
                        right: 10.0 + paddingWidth / 20,
                        top: 5.0 + paddingWidth / 20,
                        bottom: 5.0 + paddingWidth / 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(boundWidth / 10)))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNewProductStart(
                                productStore: widget.productStore,
                              )));
                },
                child: Text(
                  "Thêm món",
                  style: TextStyle(
                      color: AppColors.blue,
                      fontSize: boundWidth / 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

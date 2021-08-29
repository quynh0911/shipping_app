import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_application/screens/users/search_screen/local_widget/product_information.dart';

void main() {
  runApp(SearchStart());
}

class SearchStart extends StatelessWidget {
  SearchStart({
    Key? key,
  }) : super(key: key);

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
            "Tìm kiếm",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SearchState(),
      ),
    );
  }
}

class SearchState extends StatefulWidget {
  SearchState({
    Key? key,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchState> {
  String? _value = '';
  int? _select = 0;

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
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
            top: 10 + paddingWidth / 10,
            bottom: 10 + paddingWidth / 10,
            left: paddingWidth,
            right: paddingWidth),
        child: Column(
          children: [
            Container(
              child: new TextField(
                style: TextStyle(
                  fontSize: 12 + paddingWidth / 20,
                  color: Colors.black,
                ),
                controller: null,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(bottom: 1.0),
                    icon: Icon(Icons.search, color: AppColors.blue),
                    onPressed: () {},
                  ),
                  isDense: true,
                  hintText: 'Tìm kiếm sản phẩm',
                  fillColor: Colors.black,
                  contentPadding: EdgeInsets.only(
                      left: 10,
                      top: paddingWidth / 20,
                      bottom: paddingWidth / 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                Row(children: [
                  Container(
                    child: const Text('Huyện: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    margin: const EdgeInsets.only(bottom: 3),
                  ),
                  DropdownButton<String>(
                    hint: Text(
                      _value.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    items: provinceBG.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ])
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
                onPressed: () async {
                  // await Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             AddShipperStart()));
                  setState(() {});
                },
                child: Text(
                  "Tìm kiếm trong chợ",
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

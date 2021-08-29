import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_application/models/product_type.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/providers/add_to_market_provider/type_new_product_info.dart';
import 'package:flutter_application/providers/product_provider/product_provider.dart';
import 'package:flutter_application/screens/admin/add_to_market/local/new_product_cart.dart';
import 'package:flutter_application/screens/admin/add_to_market/local/product_list.dart';

class AddNewProductForm extends StatefulWidget {
  late ProductStore productStore;
  AddNewProductForm({required this.productStore});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddNewProductForm();
  }
}

class _AddNewProductForm extends State<AddNewProductForm> {
  String? _value = '';
  List<ProductType> listProductType = [];
  late ProductProvider productProvider;
  ProductType _type = ProductType(id: 0, name: 'Chon loai san pham');

  @override
  Widget build(BuildContext context) {
    final TypeNewProductInfo typeNewProductInfo =
        context.watch<TypeNewProductInfo>();
    productProvider = Provider.of(context);
    listProductType = Provider.of<List<ProductType>>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 19 / 20;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 9 / 10;
    else
      boundWidth = screenWidth * 7 / 10;
    double paddingWidth = (screenWidth - boundWidth) / 2;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                top: 5 + paddingWidth / 10,
                bottom: 5 + paddingWidth / 10,
                left: paddingWidth,
                right: paddingWidth),
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text('Tìm kiếm trong cua hang',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black45,
                                    )),
                              ),
                            ),
                            Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Text('Huyện: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                        fontSize: 14,
                                      )),
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
                                ]))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                child: TextField(
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 10,
                                        bottom: 10),
                                    border: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Nhập tên sản phẩm',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.indigo,
                                ),
                                padding: const EdgeInsets.all(10),
                                child: ButtonTheme(
                                    child: const Text(
                                  'Tìm kiếm',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14),
                                )))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.indigo, width: 2.0))),
                    height: 140,
                    child: Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ProductList(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      NewProductCart(),
                      Container(
                          child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 64,
                                  child: Text('Tên'),
                                  alignment: Alignment.centerRight,
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 20, left: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 10,
                                            bottom: 10),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: AppColors.blue),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: AppColors.blue),
                                        ),
                                      ),
                                      onChanged: (text) {
                                        typeNewProductInfo.typeName(text);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 64,
                                  child: Text('Đơn giá'),
                                  alignment: Alignment.centerRight,
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 20, left: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 10,
                                            bottom: 10),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: AppColors.blue),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: AppColors.blue),
                                        ),
                                      ),
                                      onChanged: (text) {
                                        typeNewProductInfo.typePrice(text);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 64,
                                  child: Text('Đơn vị'),
                                  alignment: Alignment.centerRight,
                                ),
                                Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 20, left: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 10,
                                            bottom: 10),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: AppColors.blue),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: AppColors.blue),
                                        ),
                                      ),
                                      onChanged: (text) {
                                        typeNewProductInfo.typeUnit(text);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 20),
                            child: Row(
                              children: [
                                Container(
                                  child: Text('Loại sản phẩm'),
                                  alignment: Alignment.centerRight,
                                ),
                                Padding(padding: EdgeInsets.only(left: 20)),
                                Container(
                                  child: DropdownButton<String>(
                                    hint: Text(
                                      _type.name.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    items: listProductType.map((e) {
                                      return DropdownMenuItem<String>(
                                        value: e.name,
                                        child: Container(
                                          child: Text(e.name),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        _type = listProductType
                                            .where((element) =>
                                                element.name == value)
                                            .toList()[0];
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Container(
                            margin: EdgeInsets.only(
                              top: 40 + paddingWidth / 5,
                              bottom: 40 + paddingWidth / 5,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                productProvider.addNewProductStore(
                                    typeNewProductInfo.name,
                                    _type,
                                    typeNewProductInfo.price,
                                    typeNewProductInfo.unit,
                                    widget.productStore);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: AppColors.blue,
                                  side: BorderSide(
                                      color: AppColors.blue, width: 2),
                                  padding: EdgeInsets.only(
                                      left: 20.0 + paddingWidth * 1 / 20,
                                      right: 20.0 + paddingWidth * 1 / 20,
                                      top: 10.0 + paddingWidth * 1 / 20,
                                      bottom: 10.0 + paddingWidth * 1 / 20),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30)))),
                              child: Text(
                                "Thêm vào chợ",
                                style: TextStyle(
                                  color: AppColors.yellow,
                                  fontSize: boundWidth * 1 / 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

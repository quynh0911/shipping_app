import 'package:intl/date_symbol_data_local.dart';

import './product_market_list.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter/material.dart';
import 'bill_bottom.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cart.dart';

class Market extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Market();
  }
}

class SearchProvider extends ChangeNotifier {
  List<Product>? _list;
}

class _Market extends State<Market> {
  String? _value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Đi chợ",
          style: TextStyle(
            color: AppColors.yellow,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text('Lên thực đơn',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black45,
                              )),
                        ),
                      ),
                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Container(
                              child: const Text('Huyện: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
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
                              fontSize: 17,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Nhập tên sản phẩm',
                            ),
                          ),
                        ),
                      ),
                      Container(
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
                                color: Colors.white),
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
                      bottom: BorderSide(color: Colors.indigo, width: 2.0))),
              height: 140,
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ProductMarketList(),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Cart(),
            )),
            BillBottom()
          ],
        ),
      ),
    );
  }
}

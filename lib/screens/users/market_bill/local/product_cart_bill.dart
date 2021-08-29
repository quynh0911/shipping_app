import 'package:flutter_application/models/item.dart';

import '../../../../models/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/market_screen_provider/provider.dart';

class ProductCartBill extends StatelessWidget {
  Items? cartItem;

  ProductCartBill({this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.indigo,
                  )),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: ClipRRect(
                          //borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/images/tao_pho.jpg",
                            height: 100,
                            width: 100,
                          ),
                        )),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(0),
                        //color: Colors.lightBlue,
                        constraints: const BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    //color: Colors.pink,
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      cartItem!.name.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red),
                                    )),
                              ),
                              Expanded(
                                  child: Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: double.infinity,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(cartItem!.price.toString() +
                                          ' đồng')))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('Số lượng')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black26))),
                        width: 60,
                        height: 60,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
                        child: Text(
                          '1',
                          textAlign: TextAlign.center,
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

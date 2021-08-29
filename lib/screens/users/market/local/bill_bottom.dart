import 'package:flutter_application/screens/users/market_bill/main_market_bill.dart';

import '../../../../providers/market_screen_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BillBottom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BillBottom();
  }
}

class _BillBottom extends State<BillBottom> {
  @override
  Widget build(BuildContext context) {
    String price =
        context.watch<UpdateCartListProvider>().totalBill().toString();
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
            color: Colors.black12,
          ))),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Ghi chú :',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
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
                ),
                onChanged: (text) {
                  print(text);
                },
              ))
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: const Text(
                  'Tổng tiền: ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  price + ' đồng',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              Expanded(
                child: ButtonTheme(
                  child: TextButton(
                    child: const Text(
                      'Đặt đơn',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MainMarketBill(context
                                  .watch<UpdateCartListProvider>()
                                  .cartList)));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

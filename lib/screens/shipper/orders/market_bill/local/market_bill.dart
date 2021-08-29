import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/screens/users/market/local/product_cart.dart';
import 'package:flutter_application/screens/users/market_bill/local/product_cart_bill.dart';
import 'package:flutter_application/widgets/infor_user_tags.dart';

class MarketBill extends StatelessWidget {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.indigo, width: 2.0))),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Thực đơn gồm:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45),
                      )),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Huyện: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45),
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
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.indigo, width: 2.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ProductCartBill(
                        cartItem: FAKE_CART_LIST[0],
                      ),
                      ProductCartBill(
                        cartItem: FAKE_CART_LIST[1],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.indigo, width: 2.0))),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'Ghi chú :',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45),
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
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            'Tổng tiền hàng: ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '30000 đ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 20))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            'Địa chỉ nhận hàng',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45),
                          )
                        ],
                      ),
                      InfoUserCard(
                          customer: 'Nguyễn Văn A',
                          phone: '0123456789',
                          address: 'Số 1 Đại Cồ Việt',
                          edit: () {}),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            'Phí vận chuyển: ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '30000 đ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 20))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            'Tổng thanh toán: ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '60000 đ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 20))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonTheme(
                            child: TextButton(
                              child: const Text(
                                'Đặt đơn',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.indigo),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ));
  }
}

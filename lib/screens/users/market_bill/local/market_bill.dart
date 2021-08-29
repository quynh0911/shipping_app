import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_application/models/item.dart';
import 'package:flutter_application/providers/market_screen_provider/provider.dart';
import 'package:flutter_application/providers/order_provider/order_provider.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/screens/users/market/local/product_cart.dart';
import 'package:flutter_application/screens/users/market_bill/local/product_cart_bill.dart';
import 'package:flutter_application/widgets/infor_user_tags.dart';
import 'package:provider/provider.dart';

class MarketBill extends StatefulWidget {
  List<Items>? cartList;

  MarketBill(this.cartList);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MarketBill();
  }
}

class _MarketBill extends State<MarketBill> {
  String _value = '';

  late TextEditingController _controller2;

  //String _initialValue = '';
  String _valueChanged2 = '';
  String _valueToValidate2 = '';
  String _valueSaved2 = '';

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    //_initialValue = DateTime.now().toString();
    _controller2 = TextEditingController(text: DateTime.now().toString());

    _getValue();
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _controller2.text = '02-09-2021 15:30';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String price =
        context.watch<UpdateCartListProvider>().totalBill().toString();
    String totalPaid =
        context.watch<UpdateCartListProvider>().totalPaid().toString();
    OrderProvider orderProvider = context.watch<OrderProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Di cho'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.indigo, width: 2.0))),
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
                      bottom: BorderSide(color: Colors.indigo, width: 2.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.cartList!
                    .map((e) => ProductCartBill(
                          cartItem: e,
                        ))
                    .toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(bottom: 10, top: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.indigo, width: 2.0))),
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
                              price + ' đ',
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
                              totalPaid + ' đ',
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
                  DateTimePicker(
                    type: DateTimePickerType.dateTime,
                    dateMask: 'dd-MM-yyyy hh:mm',
                    controller: _controller2,
                    //initialValue: _initialValue,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    //icon: Icon(Icons.event),
                    dateLabelText: 'Date Time',
                    use24HourFormat: false,
                    locale: Locale('vi', 'VI'),
                    onChanged: (val) => setState(() => _valueChanged2 = val),
                    validator: (val) {
                      setState(() => _valueToValidate2 = val ?? '');
                      return null;
                    },
                    onSaved: (val) => setState(() => _valueSaved2 = val ?? ''),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(
                        child: TextButton(
                          child: const Text(
                            'Đặt đơn',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          onPressed: () {
                            orderProvider.addNewOrder(
                                //widget.cartList, DateTime.now(), 'WAITING_FOR_ACCEPT',
                                //'MARKET',
                                );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.indigo),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
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
    );
  }
}

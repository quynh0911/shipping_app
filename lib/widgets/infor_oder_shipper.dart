import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InforOderShipper extends StatelessWidget {

  final String money;
  final String status;
  final String time;
  final String shipper;
  final String phone;
  final Function() delete;

  const InforOderShipper({
    Key?key,
    required this.money,
    required this.status,
    required this.time,
    required this.shipper,
    required this.phone,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    double k = (screenWidth > 600) ? 1 : 0.8;
    if(screenWidth < 300) k = 0.6;
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
      margin: (screenWidth > 350)
          ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
          : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      constraints: BoxConstraints(
        minWidth: (screenWidth > 600) ? 600 : screenWidth,
        maxHeight: (k == 1) ? 140 : 130*k,
        //maxWidth: 600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white , width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      //height: 100,
      padding: (k == 1) ? EdgeInsets.all(20) : EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Spacer(),
                    Text('Thành Tiền : ' + this.money,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: (k < 1) ? 15*k : 15,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('Trạng thái : ' + this.status,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: (k < 1) ? 15*k : 15,
                      ),
                    ),
                    Spacer(),
                    Text(this.time,
                      style: TextStyle(
                          fontSize: (k < 1) ? 15*k : 15,
                          fontWeight: FontWeight.w900
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Người vận chuyển : ' + this.shipper,
                    style: TextStyle(
                        fontSize: (k < 1) ? 15*k : 15,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  Text('Số điện thoại : ' + this.phone,
                    style: TextStyle(
                        fontSize: (k < 1) ? 15*k : 15,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: FlatButton(
                  height: 20,
                  minWidth: 10,
                  child: Text('Xóa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: (k < 1) ? 15*k : 15,
                    ),
                  ),
                  onPressed: this.delete,
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
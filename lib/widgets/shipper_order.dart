import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShipperOrder extends StatelessWidget {

  final String money;
  final String status;
  final String time;
  final Function() delete;
  const ShipperOrder({
    Key?key,
    required this.money,
    required this.status,
    required this.time,
    required this.delete
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    double k = 1;
    if(screenWidth <= 410 && screenWidth > 300) k = 0.8;
    if(screenWidth <= 340 ) k = 0.6;
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Container(
      margin: (screenWidth > 350)
          ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
          : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      constraints: BoxConstraints(
        minWidth: (screenWidth > 600) ? 600 : screenWidth,
        maxHeight: (screenWidth <= 320) ? 90 : 120,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(9, 57, 180, 1), width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child : Card(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Spacer(),
                      Text('Thành Tiền : ' + this.money,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 15*k,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Trạng thái : ' + this.status,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15*k,
                        ),
                      ),
                      Spacer(),
                      Text(this.time,
                        style: TextStyle(
                            fontSize: 15*k,
                            fontWeight: FontWeight.w900
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Center(
              child: FlatButton(
                height: 15,
                minWidth: 10,
                child: Text('Xóa',
                  style: TextStyle(
                    fontSize: 18*k,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: this.delete,
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
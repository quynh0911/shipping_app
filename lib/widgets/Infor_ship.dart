import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InforShip extends StatelessWidget {
  final String numberFood;
  final String money;
  final String status;
  final String time;
  final String customer;
  final String phone;
  final String address;
  final String shippingFee;
  final Function() watch;
  final Function() delete;

  const InforShip({
    Key? key,
    required this.numberFood,
    required this.money,
    required this.status,
    required this.time,
    required this.customer,
    required this.phone,
    required this.address,
    required this.shippingFee,
    required this.watch,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    double k = (screenWidth > 600) ? 1 : (screenWidth > 400) ? 0.8 : 0.5;
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
      margin: (screenWidth > 350)
          ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
          : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      constraints: BoxConstraints(
        minWidth: (screenWidth > 600) ? 600 : screenWidth,
        maxHeight: 300*k,
        //maxWidth: 600,
      ),
      //height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Số món : ' + this.numberFood,
                      style: TextStyle(
                          fontSize: 15*k*1.2,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Spacer(),
                    Text('Thành tiền : ' + this.money,
                      style: TextStyle(
                          fontSize: 15*k*1.2,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[

                    Text('Trạng thái' + this.status,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15*k*1.2,
                      ),
                    ),
                    Spacer(),
                    Text(this.time,
                      style: TextStyle(
                          fontSize: 15*k*1.2,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                  ],
                ),
                Row(
                    children: [
                      Text('Thông tin khách hàng :',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15*k*1.2,
                        ),
                      ),
                    ]
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15*k, right: 15*k),
            child : Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(15*k)),
              ),
              child: Container(
                padding: EdgeInsets.only(right: 10),
                height: 100*k,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Row(
                      children: [
                        Text(this.customer,
                          style: TextStyle(
                              fontSize: 15*k*1.2,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        Spacer(flex: 1,),
                        SizedBox(
                          height: (k == 1)? 36:36*k,
                          width: (k==1)?40:40*k,
                          child: TextButton(
                            onPressed: this.watch,
                            child: Text(
                              'Xem',
                              style: TextStyle(
                                color: Color.fromRGBO(9, 57, 180, 1),
                                fontSize: 15*k*1.2,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Spacer(flex: 1,),
                    Text(this.phone,
                      style: TextStyle(
                          fontSize: 15*k*1.2,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Spacer(flex: 2,),
                    Text(this.address,
                      style: TextStyle(
                          fontSize: 15*k*1.2,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Spacer(flex: 2,),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Spacer(flex: 3,),
              Text(
                'Phí Vận Chuyển : ',
                style: TextStyle(
                    fontSize: 20*k*1.2,
                    fontWeight: FontWeight.bold
                ),
              ),
              Spacer(flex: 1,),
              Text(this.shippingFee,
                style: TextStyle(
                  fontSize: 23*k*1.2,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0000FF),
                ),
              ),
              Spacer(flex: 3,)
            ],
          ),
          Spacer(),
          Center(
            child: ElevatedButton(
              style: style,
              onPressed: this.delete,
              child: (
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Xóa',
                        style: TextStyle(
                            fontSize: 20*k*1.2,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
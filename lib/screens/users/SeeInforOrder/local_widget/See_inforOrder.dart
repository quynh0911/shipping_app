import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class SeeInforOrder extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Hello World Demo Application',
      theme: ThemeData( primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
            title:const Text('Xem Đơn Ship')),
        body: _SeeInforOrder(),
      ),
    );
  }
}
class _SeeInforOrder extends StatelessWidget {
  const _SeeInforOrder({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    double k = (screenWidth > 600) ? 1 : (screenWidth > 400) ? 0.8 : 0.5;
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
      height: screenHeight,
      width: screenWidth,
      padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight/5,
            child : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Thông Tin Khách Hàng :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 117, 113, 113),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new TextField(
                          style: TextStyle(
                            color: Color.fromRGBO(29, 67, 155, 1),
                            fontWeight: FontWeight.bold,

                          ),
                          decoration: InputDecoration(
                            hintText: 'Khach hang 1',
                            fillColor: Color.fromRGBO(29, 67, 155, 1),
                            contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                          ),
                          onSubmitted: (String value){},
                        ),
                        new TextField(
                          style: TextStyle(
                            color: Color.fromRGBO(29, 67, 155, 1),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: '0987654321',
                            fillColor: Color.fromRGBO(29, 67, 155, 1),
                            contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                          ),
                          onSubmitted: (String value){},
                        ),
                      ],
                    ),
                  )
                ]
            ),
          ),
          Container(
            height: screenHeight/7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Đồ muốn chuyển :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 117, 113, 113),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new TextField(
                        style: TextStyle(
                          color: Color.fromRGBO(29, 67, 155, 1),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Cái ..., nặng khoảng ... kg trước ... h ngày .....',
                          fillColor: Color.fromRGBO(29, 67, 155, 1),
                          contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                        ),
                        onSubmitted: (String value){},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: screenHeight/6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Địa chỉ gửi :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 117, 113, 113),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue , width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Khách hàng 1',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text('sửa',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline
                                ),
                              )
                          )
                        ],
                      ),
                      Text('0987 654 321',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('Gần thôn..., xã ..., huyện ...',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: screenHeight/6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Địa chỉ nhận :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 117, 113, 113),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue , width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Khách hàng 2',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text('sửa',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline
                                ),
                              )
                          )
                        ],
                      ),
                      Text('0987 654 321',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('Gần thôn..., xã ..., huyện ...',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: 100,
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(flex: 3,),
                    Text(
                      'Phí Vận Chuyển : ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(flex: 1,),
                    Text('50 000 đ',
                      style: TextStyle(
                        fontSize: 18,
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
                    onPressed: () {},
                    child: (
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('OK',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
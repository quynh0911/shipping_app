import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/utils/DateTimePicker.dart';
import 'package:flutter_application/constances/colors.dart';

class SeeLaundry extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xem đơn giặt là"),
        backgroundColor: AppColors.pantanoBlue,
        foregroundColor: Colors.amber.shade800,
      ),
      body: _SeeLaundry(),
      // ),
    );
  }
}

class _SeeLaundry extends StatelessWidget {
  const _SeeLaundry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    double k = (screenWidth > 600) ? 1 : 0.8;
    if (screenWidth < 300) k = 0.6;
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        primary: AppColors.pantanoBlue);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight / 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Đồ muốn giặt :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(
                      color: Color.fromRGBO(29, 67, 155, 1),
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Chăn màn quần áo...',
                      fillColor: Color.fromRGBO(29, 67, 155, 1),
                      contentPadding:
                          EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                    ),
                    onSubmitted: (String value) {},
                    onChanged: (text) {},
                  ),
                )
              ],
            ),
          ),
          Container(
            height: screenHeight / 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chú ý khi giặt :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    style: TextStyle(
                      color: Color.fromRGBO(29, 67, 155, 1),
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Một số quần áo... giặt nước ấm',
                      fillColor: Color.fromRGBO(29, 67, 155, 1),
                      contentPadding:
                          EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                    ),
                    onSubmitted: (String value) {},
                  ),
                ),
              ],
            ),
          ),
          DateTimePicker(),
          Spacer(),
          DateTimePicker(),
          Spacer(),
          /*
          Container(
            height: screenHeight / 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight / 10,
                  child: Row(
                    children: [
                      Text(
                        'Hẹn Lấy :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: screenWidth / 3,
                        height: 30,
                        child: TextField(
                          style: TextStyle(
                            color: Color.fromRGBO(29, 67, 155, 1),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                              hintText: 'ngày giờ',
                              fillColor: Color.fromRGBO(29, 67, 155, 1),
                              contentPadding:
                                  EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                              border: OutlineInputBorder()),
                          onSubmitted: (String value) {},
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
                Container(
                  height: screenHeight / 10,
                  child: Row(
                    children: [
                      Text(
                        'Hẹn Giao :',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: screenWidth / 3,
                        height: 30,
                        child: TextField(
                          style: TextStyle(
                            color: Color.fromRGBO(29, 67, 155, 1),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                              hintText: 'ngày giờ',
                              fillColor: Color.fromRGBO(29, 67, 155, 1),
                              contentPadding:
                                  EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                              border: OutlineInputBorder()),
                          onSubmitted: (String value) {},
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              ],
            ),
          ),*/
          Container(
            height: screenHeight / 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Địa chỉ:',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.pantanoBlue, width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Khách hàng 2',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Xem',
                                style: TextStyle(
                                    color: AppColors.pantanoBlue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      ),
                      Text(
                        '0987 654 321',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Gần thôn..., xã ..., huyện ...',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      'Phí Vận Chuyển : ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      '50 000 đ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.pantanoBlue,
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    )
                  ],
                ),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: (Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Đặt Đơn',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/utils/DateTimePicker.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/screens/users/address/local_widget/infor_address.dart';

class SeeLaundry extends StatelessWidget {
  // This widget is the root of your application.
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
          "Giặt là",
          style: TextStyle(
            color: AppColors.yellow,
            fontWeight: FontWeight.w700,
          ),
        ),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 19 / 20;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 9 / 10;
    else
      boundWidth = screenWidth * 7 / 10;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
          SizedBox(height: 20),
          DateTimePicker(),
          SizedBox(height: 20),
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
                SizedBox(height: 10),
                InforAddressCard(address: FAKE_ADDRESSES.first),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
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
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(
                    top: 40 + paddingWidth / 5,
                    bottom: 40 + paddingWidth / 5,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.blue,
                        side: BorderSide(color: AppColors.blue, width: 2),
                        padding: EdgeInsets.only(
                            left: 20.0 + paddingWidth * 1 / 20,
                            right: 20.0 + paddingWidth * 1 / 20,
                            top: 10.0 + paddingWidth * 1 / 20,
                            bottom: 10.0 + paddingWidth * 1 / 20),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    child: Text(
                      "Đặt đơn",
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontSize: boundWidth * 1 / 25,
                        fontWeight: FontWeight.bold,
                      ),
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

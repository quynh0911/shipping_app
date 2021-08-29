import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/screens/users/SeeInforOrder/local_widget/See_inforOrder.dart';
import 'package:flutter_application/screens/users/address/local_widget/infor_address.dart';

class PlaceOrder extends StatelessWidget {
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
          "Đơn ship",
          style: TextStyle(
            color: AppColors.yellow,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: _PlaceOrder(),
      // ),
    );
  }
}

class _PlaceOrder extends StatelessWidget {
  const _PlaceOrder({Key? key}) : super(key: key);

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
    return Container(
      width: screenWidth,
      padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Thông tin khách hàng:',
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
                        contentPadding:
                            EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                      ),
                      onSubmitted: (String value) {},
                    ),
                    new TextField(
                      style: TextStyle(
                        color: Color.fromRGBO(29, 67, 155, 1),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: '0987654321',
                        fillColor: Color.fromRGBO(29, 67, 155, 1),
                        contentPadding:
                            EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                      ),
                      onSubmitted: (String value) {},
                    ),
                  ],
                ),
              )
            ]),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Đồ muốn chuyển :',
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
                          hintText:
                              'Cái ..., nặng khoảng ... kg trước ... h ngày .....',
                          fillColor: Color.fromRGBO(29, 67, 155, 1),
                          contentPadding:
                              EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                        ),
                        onSubmitted: (String value) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Địa chỉ gửi :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InforAddressCard(address: FAKE_ADDRESSES.first),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Địa chỉ nhận :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InforAddressCard(address: FAKE_ADDRESSES.last),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                //Spacer(),
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
                          color: AppColors.blue),
                    ),
                    Spacer(
                      flex: 3,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: boundWidth * 1 / 12,
                    width: boundWidth * 0.2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.blue,
                      )),
                      child: Text(
                        "Nhận",
                        style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: boundWidth * 1 / 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: boundWidth * 1 / 12,
                    width: boundWidth * 1 / 20,
                  ),
                  SizedBox(
                    height: boundWidth * 1 / 12,
                    width: boundWidth * 0.2,
                    child: ElevatedButton(
                      onPressed: () {
                        //xoá
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.blue,
                      )),
                      child: Text(
                        "Hủy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: boundWidth * 1 / 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]),
                Spacer(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     Spacer(),
                //     Container(
                //       width: MediaQuery.of(context).size.width * 0.5,
                //       height: 40,
                //       padding: new EdgeInsets.all(8.0),
                //       child: new TextField(
                //         style: TextStyle(
                //           fontSize: 12,
                //           color: Colors.black,
                //         ),
                //         controller: null,
                //         decoration: InputDecoration(
                //           suffixIcon: Icon(Icons.send),
                //           isDense: true,
                //           hintText: 'Lý do hủy ...',
                //           fillColor: Colors.black,
                //           contentPadding: EdgeInsets.all(4),
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(18.0)),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

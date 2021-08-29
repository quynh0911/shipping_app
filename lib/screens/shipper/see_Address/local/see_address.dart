import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/models/item.dart';
import 'package:flutter_application/models/order.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/widgets/Infor_ship.dart';
import 'package:flutter_application/widgets/food_item.dart';
import 'package:flutter_application/widgets/market_item.dart';

class StateSeeAddress extends StatefulWidget {
  StateSeeAddress({
    Key? key,
  }) : super(key: key);
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<StateSeeAddress> {
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 500) ? 500 : screenWidth;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thông Tin Khách Hàng :',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: screenHeight / 4,
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 400,
                          ),
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Khách hàng',
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Số điện thoại',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 40, left: 10),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.local_phone),
                          ),
                        )
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Địa Chỉ',
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Địa Chỉ :',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                constraints: BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 600,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                    hintText: 'Tìm kiếm vị trí',
                    contentPadding: EdgeInsets.all(3),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: 250,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/ggmap.png",
                        width: 200,
                        height: 150,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Container(
                  child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.pantanoBlue, // background
                    onPrimary: Colors.yellow, // foreground
                  ),
                  onPressed: () {},
                  child: Text(
                    'Chỉ Đường',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

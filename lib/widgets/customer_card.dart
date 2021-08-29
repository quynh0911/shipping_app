import 'package:flutter/material.dart';

// Thẻ chứa thông tin khách hàng
// Gồm link avatar, tên, số điện thoại, địa chỉ
class CustomerCard extends StatelessWidget {
  final String linkavatar;
  final String name;
  final String phonenumber;
  final String address;
  const CustomerCard({
    Key? key,
    required this.linkavatar,
    required this.name,
    required this.phonenumber,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 500) ? 500 : screenWidth;
    return Container(
      margin: (screenWidth > 360)
          ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
          : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      constraints: BoxConstraints(
        maxHeight: 100,
        maxWidth: 500,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(9, 57, 180, 1), width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: screenWidth < 360
                      ? EdgeInsets.only(left: 0.0, right: 0.0)
                      : EdgeInsets.only(
                          left: cardWidth * 1 / 40, right: cardWidth * 1 / 40),
                  child: Image.asset(
                    this.linkavatar,
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: screenWidth < 360
                              ? EdgeInsets.only(top: 5.0, left: 0.0, right: 0.0)
                              : EdgeInsets.only(
                                  top: 5.0,
                                  left: cardWidth * 1 / 40,
                                  right: cardWidth * 1 / 40),
                          width: screenWidth < 360
                              ? cardWidth * 5 / 10
                              : cardWidth * 6 / 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                this.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                this.phonenumber,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height: 2,
                                ),
                              ),
                              Text(
                                this.address,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          )),
                    ]),
              )
            ]),
      ),
    );
  }
}

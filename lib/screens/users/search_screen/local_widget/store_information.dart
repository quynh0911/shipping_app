import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/screens/admin/viewstore/local_widget/View_Store.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/admin/viewstore/viewstore.dart';
import 'package:url_launcher/url_launcher.dart';

// Thẻ cửa hàng chứa thông tin cửa hàng chỗ xem món ăn
// Thẻ gồm link avatar, tên, địa chỉ, thời gian mở cửa, , số điện thoại
// biến active là để cho trạng thái hiện số điện thoại, số điện thoại ko hiện đối với user
class StoreInformation extends StatefulWidget {
  late ProductStore productStore;

  StoreInformation({Key? key, required this.productStore}) : super(key: key);

  @override
  _StoreInformationState createState() => _StoreInformationState();
}

class _StoreInformationState extends State<StoreInformation> {
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
      margin: EdgeInsets.only(
        top: 1 + paddingWidth / 10,
        bottom: 1 + paddingWidth / 10,
      ),
      child: Card(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
            Widget>[
          SizedBox(width: boundWidth / 40),
          Card(
            child: Padding(
              padding: EdgeInsets.all(paddingWidth / 10),
              child: Image.asset(
                'assets/icons/store_default.png',
                width: boundWidth / 6,
                height: boundWidth / 6,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(
              left: boundWidth / 40,
              right: boundWidth / 40,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: boundWidth > 400
                            ? boundWidth * 1 / 2
                            : boundWidth * 2 / 5,
                        child: SingleChildScrollView(
                          // for Horizontal view
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productStore.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: boundWidth / 25,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/map_marker_gray.png",
                                    width: boundWidth / 30,
                                    height: boundWidth / 30,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(
                                    widget.productStore.address,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: boundWidth * 1 / 30,
                                      height: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: boundWidth / 12,
                        width: boundWidth / 6,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewStoreStart(
                                        productStore: widget.productStore)));
                          },
                          child: Text(
                            "Xem",
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: boundWidth / 25,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/icons/clock_red.png",
                        width: boundWidth / 30,
                        height: boundWidth / 30,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        widget.productStore.openTime +
                            " - " +
                            widget.productStore.closeTime,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: boundWidth * 1 / 30,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.red,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      SizedBox(
                        height: boundWidth * 1 / 12,
                        width: boundWidth * 1 / 6,
                        child: IconButton(
                          onPressed: () async {
                            print('tel:${widget.productStore.phone}');
                            if (await canLaunch(
                                'tel:${widget.productStore.phone}')) {
                              await launch('tel:${widget.productStore.phone}');
                            } else {
                              throw 'Could not launch';
                            }
                          },
                          icon: Icon(Icons.phone),
                        ),
                      ),
                    ],
                  ),
                ]),
          )),
        ]),
      ),
    );
  }
}

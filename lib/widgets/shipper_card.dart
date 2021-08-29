import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/admin/shipper/view_shipper.dart';
import 'package:flutter_application/models/user.dart';

// Thẻ shipper chứa thông tin shipper trong phần quản lý shipper
// Thẻ gồm link avatar, tên, số điện thoại, trạng thái hoạt động, nít Xem,  nút Giao
class ShipperCard extends StatefulWidget {
  final User shipper;

  const ShipperCard({Key? key, required this.shipper}) : super(key: key);
  @override
  _ShipperCardState createState() => _ShipperCardState();
}

class _ShipperCardState extends State<ShipperCard> {
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
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.shipper.activated! == true
                ? AppColors.blue
                : AppColors.gray,
            width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
            Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.only(
                left: boundWidth * 1 / 40,
                right: boundWidth * 1 / 40,
              ),
              child: Image.asset(
                "assets/images/logo.png",
                width: boundWidth * 1 / 6,
                height: boundWidth * 1 / 6,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(
              left: boundWidth * 1 / 40,
              right: boundWidth * 1 / 40,
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
                                widget.shipper.firstName +
                                    " " +
                                    widget.shipper.lastName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: boundWidth * 1 / 30,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                widget.shipper.phone,
                                style: TextStyle(
                                  fontSize: boundWidth * 1 / 30,
                                  height: 1.5,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: boundWidth * 1 / 12,
                        width: boundWidth * 1 / 6,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ViewShipperStart(
                                          shipper: widget.shipper,
                                        )));
                          },
                          child: Text(
                            "Xem",
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: boundWidth * 1 / 25,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: [
                          widget.shipper.activated! == true
                              ? Text(
                                  'Đang hoạt động',
                                  style: TextStyle(
                                    fontSize: boundWidth * 1 / 30,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.orange,
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              : Text(
                                  'Không hoạt động',
                                  style: TextStyle(
                                    fontSize: boundWidth * 1 / 30,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blue,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        height: boundWidth * 1 / 15,
                        width: boundWidth * 0.18,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                            widget.shipper.activated! == true
                                ? AppColors.blue
                                : AppColors.gray,
                          )),
                          child: Text(
                            "Giao",
                            style: TextStyle(
                              color: widget.shipper.activated! == true
                                  ? AppColors.yellow
                                  : AppColors.brown,
                              fontSize: boundWidth * 1 / 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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

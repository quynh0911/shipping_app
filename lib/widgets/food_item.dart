import 'package:flutter/material.dart';

// Thẻ shipper chứa thông tin shipper trong phần quản lý shipper
// Thẻ gồm link avatar, tên, số điện thoại, trạng thái hoạt động, nít Xem,  nút Giao
class FoodItem extends StatefulWidget {
  final String linkavatar;
  final String name;
  final String type;
  final int money;
  final bool add;
  const FoodItem({
    Key? key,
    required this.linkavatar,
    required this.name,
    required this.type,
    required this.money,
    required this.add,
  }) : super(key: key);

  @override
  _FoodItemState createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      width: screenWidth > 400 ? 250 : cardWidth * 6 / 10,
      height: 110,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(9, 57, 180, 1), width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                child: Image.asset(
                  widget.linkavatar,
                  width: 80,
                  height: 80,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                  child: Container(
                margin: (screenWidth > 360)
                    ? EdgeInsets.only(left: 5.0, right: 5.0, top: 0.0)
                    : EdgeInsets.only(left: 0, right: 0, top: 0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 120,
                            child: Text(
                              widget.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                height: 2,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.indeterminate_check_box,
                            color: Color.fromRGBO(255, 139, 102, 1),
                            size: 12,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.type,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(
                                left: 10, top: 6, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(9, 57, 180, 1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              widget.money.toString(),
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          if (widget.add == true)
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: Color.fromRGBO(9, 57, 180, 1),
                                ),
                                onPressed: () {},
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

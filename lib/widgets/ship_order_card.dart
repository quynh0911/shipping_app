import 'package:flutter/material.dart';

// Thẻ trong phần Đơn ship
// Chứa thông tin đồ ship, thời gian cần ship, nút Xem
class ShipOrderCard extends StatefulWidget {
  final String description;
  final String deadline;
  final String type;

  const ShipOrderCard({
    Key? key,
    required this.description,
    required this.deadline,
    required this.type,
  }) : super(key: key);
  @override
  _ShipOrderCardState createState() => _ShipOrderCardState();
}

class _ShipOrderCardState extends State<ShipOrderCard> {
  void _xemClick() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 360) ? 360 : screenWidth;
    return Container(
        margin: (screenWidth > 360)
            ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
            : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
        constraints: BoxConstraints(
          minWidth: (screenWidth > 360) ? 360 : screenWidth,
          maxHeight: 120,
          maxWidth: 360,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(9, 57, 180, 1), width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Card(
          child: Container(
            margin: screenWidth < 360
                ? EdgeInsets.only(left: 10.0, right: 10.0)
                : EdgeInsets.only(
                    left: cardWidth * 1 / 40, right: cardWidth * 1 / 40),
            width: screenWidth < 360 ? cardWidth * 6 / 10 : cardWidth * 7 / 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      widget.type == "Đơn ship"
                          ? "Đồ muốn chuyển:"
                          : "Đồ mang đi giặt",
                      style: TextStyle(
                        color: Color.fromRGBO(135, 123, 123, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 36,
                      width: 40,
                      child: TextButton(
                        onPressed: _xemClick,
                        child: Text(
                          "Xem",
                          style: TextStyle(
                            color: Color.fromRGBO(9, 57, 180, 1),
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: screenWidth < 360
                          ? EdgeInsets.only(left: 20.0, right: 20.0)
                          : EdgeInsets.only(
                              left: cardWidth * 1 / 40,
                              right: cardWidth * 1 / 40),
                      width: screenWidth < 360
                          ? cardWidth * 6 / 10
                          : cardWidth * 7 / 10,
                      height: 42,
                      child: SingleChildScrollView(
                        // for Vertical scrolling
                        scrollDirection: Axis.vertical,
                        child: Text(
                          widget.description,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      widget.deadline,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

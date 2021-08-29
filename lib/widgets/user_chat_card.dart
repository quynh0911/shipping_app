import 'package:flutter/material.dart';

// Thẻ chat của người dùng trong màn hình Admin
// Thẻ gồm link avatar, tên, đoạn chat gần nhất và đã xem hay chưa
class UserChatCard extends StatefulWidget {
  final bool seen;
  final String linkavatar;
  final String name;
  final String string;
  const UserChatCard({
    Key? key,
    required this.seen,
    required this.linkavatar,
    required this.name,
    required this.string,
  }) : super(key: key);

  @override
  _UserChatCardState createState() => _UserChatCardState();
}

class _UserChatCardState extends State<UserChatCard> {
  void _cardClick() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    return Container(
      margin: (screenWidth > 360)
          ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
          : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      constraints: BoxConstraints(
        maxHeight: 80,
        maxWidth: 600,
      ),
      decoration: BoxDecoration(),
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
                    widget.linkavatar,
                    width: 64,
                    height: 64,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Column(children: <Widget>[
                  Row(
                    children: [
                      Container(
                          padding: screenWidth < 360
                              ? EdgeInsets.only(
                                  top: 10.0, left: 0.0, right: 0.0)
                              : EdgeInsets.only(
                                  top: 10.0,
                                  left: cardWidth * 1 / 40,
                                  right: cardWidth * 1 / 40),
                          width: screenWidth < 360
                              ? cardWidth * 5 / 10
                              : cardWidth * 6 / 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                widget.string,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  height: 2,
                                ),
                              ),
                            ],
                          )),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        width: 10,
                        height: 10,
                        color: widget.seen == false
                            ? Color.fromRGBO(68, 255, 221, 1)
                            : Color.fromRGBO(255, 255, 255, 0),
                      ),
                    ],
                  ),
                ]),
              )
            ]),
      ),
    );
  }
}

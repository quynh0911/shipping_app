import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/fakeData.dart';

class Comment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 0.9;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 0.95;
    else
      boundWidth = screenWidth * 0.7;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(boundWidth / 50),
            child: Image.asset(
              "assets/icons/talk_blue.png",
              width: boundWidth / 8,
              height: boundWidth / 8,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "31/08/2021 18:30",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: boundWidth * 1 / 40,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Khánh hàng 1",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: boundWidth * 1 / 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      "Ngon lắm ạ!  Ngon lắm ạ!   Ngon lắm ạ!  Ngon lắm ạ!  Ngon lắm ạ!  Ngon lắm ạ!  Ngon lắm ạ! Ngon lắm ạ!  Ngon lắm ạ!   Ngon lắm ạ!  Ngon lắm ạ!  Ngon lắm ạ!  Ngon lắm ạ!  Ngon lắm ạ!",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: boundWidth * 1 / 30,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: boundWidth / 4,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: FAKE_COMMENT_IMAGES
                          .map(
                            (image) => Padding(
                              padding: EdgeInsets.only(right: paddingWidth),
                              child: Image.asset(
                                image,
                                width: boundWidth / 5,
                                height: boundWidth / 5,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

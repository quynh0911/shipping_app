import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/models/order.dart';
import 'package:flutter_application/providers/order_provider/order_provider.dart';

class ShipperNotifications extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _Notifications createState() {
    return _Notifications();
  }
}

class _Notifications extends State<ShipperNotifications> {
  OrderProvider? _orderProvider;

  // @override
  // void didChangeDependencies() {
  //   _orderProvider = Provider.of(context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    _orderProvider = context.watch<OrderProvider>();
    var listOrder = _orderProvider!.listOrder;
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 19 / 20;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 9 / 10;
    else
      boundWidth = screenWidth * 7 / 10;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
            top: 10 + paddingWidth / 5,
            bottom: 10 + paddingWidth / 5,
            left: paddingWidth,
            right: paddingWidth),
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Gần đây',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: boundWidth * 1 / 25,
                      color: AppColors.brown,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: AppColors.blue,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: AppColors.blue, width: 2),
                        padding: EdgeInsets.only(
                            left: 10.0 + paddingWidth * 1 / 20,
                            right: 10.0 + paddingWidth * 1 / 20,
                            top: 5.0 + paddingWidth * 1 / 20,
                            bottom: 5.0 + paddingWidth * 1 / 20),
                      ),
                      child: Text(
                        'Tất cả',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: boundWidth * 1 / 27,
                          color: Colors.grey,
                        ),
                      )),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: AppColors.blue,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: AppColors.blue, width: 2),
                        padding: EdgeInsets.only(
                            left: 10.0 + paddingWidth * 1 / 20,
                            right: 10.0 + paddingWidth * 1 / 20,
                            top: 5.0 + paddingWidth * 1 / 20,
                            bottom: 5.0 + paddingWidth * 1 / 20),
                      ),
                      child: Text(
                        'Đã đọc',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: boundWidth * 1 / 27,
                          color: Colors.grey,
                        ),
                      )),
                  TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: AppColors.blue,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: AppColors.blue, width: 2),
                        padding: EdgeInsets.only(
                            left: 10.0 + paddingWidth * 1 / 20,
                            right: 10.0 + paddingWidth * 1 / 20,
                            top: 5.0 + paddingWidth * 1 / 20,
                            bottom: 5.0 + paddingWidth * 1 / 20),
                      ),
                      child: Text(
                        'Chưa đọc',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: boundWidth * 1 / 27,
                          color: Colors.grey,
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listOrder.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: notification(context, listOrder[index]),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget notification(BuildContext context, Order order) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 600) ? 600 : screenWidth;
    double k = (screenWidth > 320) ? 1 : screenWidth / 1000 * 1.5;
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Container(
      margin: (screenWidth > 350)
          ? EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0)
          : EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
      constraints: BoxConstraints(
        minWidth: (screenWidth > 600) ? 600 : screenWidth,
        maxHeight: 120,
        //maxWidth: 600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(9, 57, 180, 1), width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        //shadowColor: Colors.green[100],
        child: InkWell(
          splashColor: AppColors.blue.withAlpha(30),
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                title: new Text("Material Dialog"),
                content: new Text("Hey! I'm Coflutter!"),
                actions: <Widget>[
                  TextButton(
                    child: Text('Close me!'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            );
          },
          child: SizedBox(
            //height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      order.orderState.toString(),
                      style: TextStyle(
                        fontSize: (k == 1) ? 19 : 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(29, 67, 155, 1),
                      ),
                    ),
                    Spacer(
                      flex: 9,
                    ),
                    Text(
                      'Ngày 15/8/2020 lúc 16:30',
                      style: TextStyle(
                          fontSize: (k == 1) ? 15 : 15 * 0.8,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  order.orderState.toString(),
                  style: TextStyle(
                      fontSize: (k == 1) ? 15 : 15 * 0.8,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                Spacer(
                  flex: 1,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Giao cho khách hai hộp quà',
                      style: TextStyle(
                          fontSize: (k == 1) ? 15 : 15 * 0.8,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.remove_circle))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

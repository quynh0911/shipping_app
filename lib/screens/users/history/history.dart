import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application/models/order.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_application/screens/users/history/local_widgets/order_history.dart';

void main() {
  runApp(HistoryStart());
}

class HistoryStart extends StatelessWidget {
  // This widget is the root of your application.
  HistoryStart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lịch sử',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: History(
        title: 'Lịch sử',
      ),
    );
  }
}

class History extends StatefulWidget {
  History({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Order> listOrder = FAKE_ORDER;
  String typeDropDown = "Tất cả";
  String statusDropDown = "Tất cả";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  _startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != startDate)
      setState(() {
        startDate = picked;
      });
  }

  _endDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != endDate)
      setState(() {
        endDate = picked;
      });
  }

  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var cardWidth = (screenWidth > 500) ? 500 : screenWidth;

    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
            width: cardWidth * 1.0,
            height: 80,
            child: Column(
              children: [
                Row(children: [
                  Text(
                    "Loại: ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(135, 123, 123, 1),
                    ),
                  ),
                  Container(
                    height: 22,
                    padding: EdgeInsets.only(left: 1.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(9, 57, 180, 1), width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: DropdownButton<String>(
                      value: typeDropDown,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 22,
                      elevation: 8,
                      underline: Container(
                        height: 1,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          typeDropDown = newValue!;
                        });
                      },
                      items: orderTypes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            " " + value,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Trạng thái: ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(135, 123, 123, 1),
                    ),
                  ),
                  Container(
                    height: 22,
                    padding: EdgeInsets.only(left: 1.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(9, 57, 180, 1), width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: DropdownButton<String>(
                      value: statusDropDown,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 22,
                      elevation: 8,
                      underline: Container(
                        height: 1,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          statusDropDown = newValue!;
                        });
                      },
                      items: orderState
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            " " + value,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Từ ngày: ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(135, 123, 123, 1),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _startDate(context),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(135, 123, 123, 0.3))),
                      child: Container(
                        width: 64,
                        height: 16,
                        alignment: Alignment.center,
                        child: Text(
                          "${startDate.toLocal().day}" +
                              "/" +
                              "${startDate.toLocal().month}" +
                              "/" +
                              "${startDate.toLocal().year}",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Đến ngày: ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(135, 123, 123, 1),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _endDate(context),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(135, 123, 123, 0.3))),
                      child: Container(
                        width: 64,
                        height: 16,
                        alignment: Alignment.center,
                        child: Text(
                          "${endDate.toLocal().day}" +
                              "/" +
                              "${endDate.toLocal().month}" +
                              "/" +
                              "${endDate.toLocal().year}",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 20.0),
            width: cardWidth * 1,
            height: 4,
            decoration: BoxDecoration(
              color: Color.fromRGBO(9, 57, 180, 1),
            ),
          ),
          buildHistory(context, typeDropDown, statusDropDown)
        ]),
      ),
    );
  }

  Widget buildHistory(BuildContext context, String type, String status) {
    return Column(
      children: [
        if (type == "Tất cả" && status == "Tất cả")
          for (var item in listOrder) OrderHistory(order: item),
        if (type == "Tất cả")
          for (var item in listOrder)
            // if (item.state == status) OrderHistory(order: item),
            if (status == "Tất cả")
              for (var item in listOrder)
                // if (item.type == type) OrderHistory(order: item),
                if (type != "Tất cả" && status != "Tất cả")
                  for (var item in listOrder)
                    // if (item.type == type && item.state == status)
                    OrderHistory(order: item),
      ],
    );
  }
}

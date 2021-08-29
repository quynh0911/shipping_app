import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IncomeTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IncomeTable();
  }
}

class _IncomeTable extends State<IncomeTable> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(4)),
        Row(
          children: [
            Expanded(
              child: Container(
                width: width,
                child: Table(
                  border: TableBorder(
                      bottom: BorderSide(color: Colors.black38, width: 1),
                      horizontalInside: BorderSide(
                          width: 1,
                          color: Colors.black38,
                          style: BorderStyle.solid)),
                  columnWidths: <int, TableColumnWidth>{
                    0: FractionColumnWidth(0.1),
                    1: FractionColumnWidth(0.3),
                    2: FractionColumnWidth(0.1),
                    3: FractionColumnWidth(0.25),
                    4: FractionColumnWidth(0.25),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: Text(
                            'STT',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: Text(
                            'Phân loại',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: Text(
                            'Tổng đơn',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          child: Text(
                            'Tổng tiền ship',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          child: Text(
                            'Tổng thanh toán',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "Đơn hàng",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "50",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "1.500.000",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "14.500.000",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "1",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "Đơn ship",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "50",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "1.500.000",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "14.500.000",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(padding: EdgeInsets.all(4)),
        Row(
          children: [
            Expanded(
              child: Container(
                width: width,
                child: Table(
                    border: TableBorder(
                        top: BorderSide(color: Colors.indigo, width: 2),
                        bottom: BorderSide(color: Colors.indigo, width: 2)),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FractionColumnWidth(0.5),
                      1: FractionColumnWidth(0.25),
                      2: FractionColumnWidth(0.25),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(children: [
                        Container(
                          alignment: Alignment.centerRight,
                          height: 30,
                          child: Text(
                            "Tổng",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w900),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "1.500.000",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          child: Text(
                            "14.500.000",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ])
                    ]),
              ),
            )
          ],
        )
      ],
    );
  }
}

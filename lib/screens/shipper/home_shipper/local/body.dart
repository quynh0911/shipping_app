import 'package:flutter/material.dart';
import 'package:flutter_application/screens/shipper/home_shipper/local/date_picker.dart';
import 'package:flutter_application/constances/colors.dart';
import 'income_table.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Body();
  }
}

class _Body extends State<Body> {
  String _value = '';
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
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Container(
              //   width: 55,
              //   child: Text('Shipper'),
              // ),
              // Expanded(
              //   child: Container(
              //     decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Colors.indigo,
              //           width: 2.0,
              //         ),
              //         borderRadius: BorderRadius.all(Radius.circular(10))),
              //     child: TextField(
              //       style: const TextStyle(
              //         fontSize: 17,
              //       ),
              //       decoration: InputDecoration(
              //         isDense: true,
              //         contentPadding: const EdgeInsets.only(
              //             left: 15, right: 15, top: 10, bottom: 10),
              //         border: UnderlineInputBorder(
              //             borderRadius: BorderRadius.circular(10)),
              //         focusedBorder: InputBorder.none,
              //         enabledBorder: InputBorder.none,
              //         errorBorder: InputBorder.none,
              //         disabledBorder: InputBorder.none,
              //       ),
              //     ),
              //   ),
              // ),
              Text(
                'Huyện: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: boundWidth * 1 / 25,
                  color: AppColors.brown,
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                width: 150,
                child: DropdownButton<String>(
                  hint: Text(
                    _value.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  items: <String>[
                    'TP.Bắc Giang',
                    'Lục Ngạn',
                    'Lục Nam',
                    'Yên Thế',
                    'Lạng Giang',
                    'Yên Dũng',
                    'Tân Yên',
                    "Sơn Động",
                    "Hiệp Hòa",
                    "Việt Yên",
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _value = value as String;
                    });
                  },
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Phí đơn hàng',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(''),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.indigo,
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text('50000'),
                      ),
                      Text(' VND/ '),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('1'),
                      ),
                      Text(' km')
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Phí đi chợ',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(''),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.indigo,
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text('50000'),
                      ),
                      Text(' VND/ '),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('1'),
                      ),
                      Text(' km')
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Phí giặt là',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(''),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 10, right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.indigo,
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text('50000'),
                      ),
                      Text(' VND/ '),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.indigo,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('1'),
                      ),
                      Text(' km')
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    'Thu nhập cá nhân',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              ),
              Expanded(
                child: Text(''),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Từ'),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      DateTimePicker()
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Text('Đến'),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      DateTimePicker()
                    ],
                  ),
                ),
              )
            ],
          ),
          IncomeTable()
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeliveryAddress extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giao hàng siêu tốc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Giao hàng siêu tốc')),
        body: _DeliveryAddress(),
      ),
    );
  }
}

class _DeliveryAddress extends StatelessWidget {
  const _DeliveryAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Container(
        width: size.width,
        height: size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          const Text(
            '  Danh sach dia chi.....',
            style:
                TextStyle(fontSize: 20, color: Color.fromRGBO(29, 67, 155, 1)),
          ),
          Container(
            margin: EdgeInsets.only(left: 11.0, right: 13.0, bottom: 10.0),
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromRGBO(9, 57, 180, 1), width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        '  Khach hang',
                      ),
                      Spacer(),
                      TextButton(
                        child: const Text('Xoa'),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Text('  sdt'),
                  Text('  dia chi'),
                ],
              ),
            ),
          ),
          const Text(
            '  Tim kiem dia chi.....',
            style:
                TextStyle(fontSize: 20, color: Color.fromRGBO(29, 67, 155, 1)),
          ),
          Padding(
            padding: new EdgeInsets.all(8.0),
            child: new TextField(
              style: TextStyle(
                color: Color.fromRGBO(29, 67, 155, 1),
                fontWeight: FontWeight.bold,
              ),
              controller: null,
              decoration: InputDecoration(
                  hintText: 'Tim kiem vi tri',
                  fillColor: Color.fromRGBO(29, 67, 155, 1),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
              onSubmitted: (String value) {},
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/ggmap.png',
              width: 130,
              height: 150,
            ),
          ),
          new TextField(
            style: TextStyle(
              color: Color.fromRGBO(29, 67, 155, 1),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: 'Ho va Ten',
              fillColor: Color.fromRGBO(29, 67, 155, 1),
              contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            ),
            onSubmitted: (String value) {},
          ),
          new TextField(
            style: TextStyle(
              color: Color.fromRGBO(29, 67, 155, 1),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: 'So Dien Thoai',
              fillColor: Color.fromRGBO(29, 67, 155, 1),
              contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
            ),
            onSubmitted: (String value) {},
          ),
          new TextField(
            style: TextStyle(
              color: Color.fromRGBO(29, 67, 155, 1),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: 'Dia Chi',
              fillColor: Color.fromRGBO(29, 67, 155, 1),
              contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
            ),
            onSubmitted: (String value) {},
          ),
          Spacer(
            flex: 1,
          ),
          Center(
              child: ElevatedButton(
            style: style,
            onPressed: () {},
            child: (Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.add),
                Text('Them Dia Chi'),
              ],
            )),
          )),
          Spacer()
        ]));
  }
}

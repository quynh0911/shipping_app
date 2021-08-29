import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';

class MallProductPrice extends StatefulWidget {
  @override
  _MallProductPriceState createState() {
    return _MallProductPriceState();
  }
}

class _MallProductPriceState extends State<MallProductPrice> {
  Size? size;
  @override
  Widget build(BuildContext context) {
    if (size == null) {
      size = MediaQuery.of(context).size;
    }
    // print(size!.width);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          width: size!.width * 0.6,
          height: size!.height * 0.15,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
          ),
          child: Card(
            elevation: 0,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset("assets/images/tra_chanh.jpg"),
              title: Text(
                "Trà chanh",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text("30 000 đ /lạng"),
            ),
          ),
        ),
        Text(
          "x",
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Text(
            "5",
            style: TextStyle(inherit: false, color: Colors.black),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
        ),
        Text(
          "lạng",
          style: TextStyle(inherit: false, color: Colors.black),
        ),
        // TextField(

        //   keyboardType: TextInputType.number,
        //   decoration: InputDecoration(
        //       border: OutlineInputBorder(
        //           borderRadius: BorderRadius.zero,
        //           borderSide: BorderSide(color: Colors.black))),
        // )
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: MallProductPrice(),
    ),
  );
}

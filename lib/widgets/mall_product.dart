import 'package:flutter/material.dart';

class MallProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        top: 8,
      ),
      width: size.width * 0.3,
      // height: size.height * 0.3,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            width: size.width * 0.3 * 0.8,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              "assets/images/tra_chanh.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Trà chanh chém gió Hà Nội",
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}

main(List<String> args) {
  runApp(MaterialApp(home: Scaffold(body: MallProduct())));
}

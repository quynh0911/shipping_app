import 'package:flutter/material.dart';
import 'package:flutter_application/models/product.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() {
    return _ListProductState();
  }
}

class _ListProductState extends State<ListProduct> {
  //
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Container();
    });
  }
}

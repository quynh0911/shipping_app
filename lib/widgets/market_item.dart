import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';

class MarketItem extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  const MarketItem({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
      //alignment: Alignment.center,
      padding: EdgeInsets.all(0),
      width: 200,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.pantanoBlue),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Card(
          elevation: 0,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.asset(this.image),
            title: Text(
              this.name,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(this.price.toString() + '/lạng'),
          ),
        ),
      ),
    );
  }
}

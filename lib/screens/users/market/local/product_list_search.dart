import './product_market_list.dart';
import 'package:flutter/material.dart';

class ProductListSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ProductMarketList(),
          ),
        )
      ],
    );
  }
}

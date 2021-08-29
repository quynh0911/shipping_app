import 'package:provider/provider.dart';

import './product_market.dart';
import '../../../../models/product.dart';
import 'package:flutter/material.dart';
import '../../../fakeData.dart';

class ProductMarketList extends StatelessWidget {
  //
  List<Product> _list = [];
  @override
  Widget build(BuildContext context) {
    _list = Provider.of<List<Product>>(context);

    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: _buildProductMarketListWidget(),
    );
  }

  List<Widget> _buildProductMarketListWidget() {
    List<Widget>? listProductWidget = [];
    if (_list != null) {
      listProductWidget = _list.map((e) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: ProductMarket(e),
        );
      }).toList();
    }
    return listProductWidget;
  }
}

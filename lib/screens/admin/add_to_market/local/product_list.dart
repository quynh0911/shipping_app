import 'package:flutter_application/screens/admin/add_to_market/local/product_list_item.dart';
import 'package:flutter_application/screens/users/market/local/product_market.dart';

import '../../../../models/product.dart';
import 'package:flutter/material.dart';
import '../../../fakeData.dart';

class ProductList extends StatelessWidget {
  List<Product>? _list = FAKE_PRODUCT_MARKET;
  List<Widget> _buildProductMarketListWidget() {
    List<Widget>? listProductWidget = [];
    if (_list != null) {
      listProductWidget = _list!.map((e) {
        return Container(
          margin: const EdgeInsets.all(5),
          child: ProductListItem(e),
        );
      }).toList();
    }
    return listProductWidget;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: _buildProductMarketListWidget(),
    );
  }
}

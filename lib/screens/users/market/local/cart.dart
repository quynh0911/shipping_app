import 'package:flutter_application/models/item.dart';

import './product_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/item.dart';
import '../../../../providers/market_screen_provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Cart();
  }
}

List<Widget> _buildProductCart(List<Items> cartList) {
  return cartList.map((e) {
    return ProductCart(
      cartItem: e,
    );
  }).toList();
}

class _Cart extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          _buildProductCart(context.watch<UpdateCartListProvider>().cartList),
    );
  }
}

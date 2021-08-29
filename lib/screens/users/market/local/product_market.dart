import 'package:flutter_application/models/item.dart';

import '../../../../models/item.dart';
import '../../../../models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/market_screen_provider/provider.dart';

class ProductMarket extends StatelessWidget {
  Product? _product;

  ProductMarket(this._product);

  @override
  Widget build(BuildContext context) {
    UpdateCartListProvider updateCartListProvider =
        context.watch<UpdateCartListProvider>();
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Image.asset(
              _product!.image.toString(),
              width: 100,
              height: 100,
            ),
            Text(_product!.name.toString())
          ],
        ),
      ),
      onTap: () {
        Items cartItem = Items(
            id: _product!.id!,
            name: _product!.name,
            price: _product!.price,
            amount: 1);
        updateCartListProvider.addCartItem(cartItem);
        print(updateCartListProvider.cartList.length.toString());
      },
    );
  }
}

import '../../../../models/product.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  late Product? _product;

  ProductListItem(this._product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Image.asset(
              _product!.image.toString(),
              width: 80,
              height: 80,
            ),
            Text(_product!.name.toString())
          ],
        ),
      ),
    );
  }
}

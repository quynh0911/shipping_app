import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/models/product_type.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/providers/add_to_market_provider/type_new_product_info.dart';
import 'package:flutter_application/providers/product_provider/product_provider.dart';
import 'package:flutter_application/screens/fakeData.dart';

import 'local_widget/View_Store.dart';

class ViewStore extends StatelessWidget {
  ProductStore productStore;
  ViewStore({required this.productStore});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => TypeNewProductInfo('Ten', 0, 'Don vi')),
        FutureProvider<List<ProductType>>(
            create: (_) => ProductProvider().fetchDataAllProductType(),
            initialData: []),
        ChangeNotifierProvider(create: (_) => ProductProvider())
      ],
      child: MaterialApp(
        home: StateViewStore(
          productStore: productStore,
        ),
      ),
    );
  }
}

main(List<String> args) {
  runApp(ViewStore(productStore: FAKE_STORE[0]));
}

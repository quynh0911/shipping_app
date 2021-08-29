import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/models/product_type.dart';
import 'package:flutter_application/providers/add_to_market_provider/type_new_product_info.dart';
import 'package:flutter_application/providers/product_provider/product_provider.dart';
import 'package:flutter_application/screens/admin/add_to_market/local/add_to_market.dart';

class MainAddToMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TypeNewProductInfo>(
            create: (_) => TypeNewProductInfo('Tên', 0, 'Đơn vị')),
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
        FutureProvider<List<ProductType>>(
            create: (context) => ProductProvider().fetchDataAllProductType(),
            initialData: [])
      ],
      child: AddToMarketStart(),
    );
  }
}

main(List<String> args) {
  runApp(MainAddToMarket());
}

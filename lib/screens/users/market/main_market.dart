import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/providers/order_provider/order_provider.dart';
import 'package:flutter_application/providers/product_provider/product_provider.dart';
import './local/market.dart';
import '../../../providers/market_screen_provider/provider.dart';

class MainMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UpdateCartListProvider>(
              create: (_) => UpdateCartListProvider()),
          ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
          FutureProvider<List<Product>>(
              create: (_) => ProductProvider().fetchDataAllProduct(),
              initialData: [])
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Market(),
          localizationsDelegates: [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en', 'US')],
        ));
  }
}

main(List<String> args) {
  runApp(MainMarket());
}

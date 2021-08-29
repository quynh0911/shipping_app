import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/models/address.dart';
import 'package:flutter_application/providers/product_provider/product_provider.dart';
import 'package:flutter_application/screens/admin/addstore/local_widget/add_info_store.dart';

class AddStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
      child: AddInfoStore(
          // address: new Address(
          //     latitude: 0, longitude: 0, name: "", phone: "", description: ""),
          ),
    );
  }
}

main(List<String> args) {
  runApp(AddStore());
}

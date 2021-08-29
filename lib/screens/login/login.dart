import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/providers/auth/auth_provider.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/screens/login/local_widget/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      home:
          ChangeNotifierProvider(create: (_) => AuthProvider(), child: Body()),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'local_widget/See_laundry.dart';

class StateSeeLaundry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeeLaundry(),
    );
  }
}

main(List<String> args) {
  runApp(StateSeeLaundry());
}

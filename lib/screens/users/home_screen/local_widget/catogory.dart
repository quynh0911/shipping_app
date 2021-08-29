import 'package:flutter/material.dart';

class Catogory extends StatelessWidget {
  late final Color _color;
  late final String _name;
  Catogory({
    required Color color,
    required String name,
  }) {
    this._color = color;
    this._name = name;
  }

  Color get color => _color;
  set color(Color color) => this._color = color;
  String get name => _name;
  set name(String name) => this._name = name;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 19 / 20;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 9 / 10;
    else
      boundWidth = screenWidth * 7 / 10;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return Padding(
      padding: EdgeInsets.all(paddingWidth / 10),

      child: Container(
        child: Column(children: [
          Container(
            width: boundWidth / 7,
            height: boundWidth / 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(boundWidth / 20),
              color: color,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: boundWidth * 1 / 30,
              height: 2,
            ),
          ),
        ]),
      ),
      // ),
    );
  }
}

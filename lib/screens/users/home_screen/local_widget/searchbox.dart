import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/users/search_screen/search_screen.dart';

class SearchBar extends StatelessWidget {
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
    return Container(
      child: new TextField(
        onSubmitted: (String str) {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return MaterialApp(
          //       home: Scaffold(
          //     body: SearchProductPage(),
          //   ));
          // }));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchStart()),
          );
        },
        style: TextStyle(
          fontSize: 12 + paddingWidth / 20,
          color: Colors.black,
        ),
        controller: null,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            padding: EdgeInsets.only(bottom: 1.0),
            icon: Icon(Icons.search, color: AppColors.blue),
            onPressed: () {},
          ),
          isDense: true,
          hintText: 'Tìm kiếm đồ ăn, thức uống',
          fillColor: Colors.black,
          contentPadding: EdgeInsets.only(
              left: 10, top: paddingWidth / 20, bottom: paddingWidth / 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
      ),
    );
  }
}

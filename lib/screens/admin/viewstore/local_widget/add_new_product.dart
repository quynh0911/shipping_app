import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/widgets/text_widget.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/screens/admin/shipper/select_shipper.dart';
import 'package:flutter_application/screens/users/search_screen/local_widget/store_information.dart';

class AddNewProductStart extends StatelessWidget {
  ProductStore productStore;
  AddNewProductStart({required this.productStore});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: AppColors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            color: AppColors.yellow,
            onPressed: () => Navigator.pop(context),
          ),
          title: new Text(
            "Thêm món",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: AddNewProductState(
          productStore: this.productStore,
        ),
      ),
    );
  }
}

class AddNewProductState extends StatefulWidget {
  ProductStore productStore;
  AddNewProductState({required this.productStore});

  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProductState> {
  bool foodChecked = false;
  bool drinkChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.gray;
    }
    return AppColors.blue;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 0.9;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 0.95;
    else
      boundWidth = screenWidth * 0.7;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: 10 + paddingWidth / 10,
              bottom: 10 + paddingWidth / 10,
              left: paddingWidth,
              right: paddingWidth),
          child: Column(
            children: [
              StoreInformation(
                productStore: widget.productStore,
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10 + paddingWidth / 10,
                ),
                width: boundWidth / 3,
                height: boundWidth / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png")),
                  borderRadius:
                      BorderRadius.all(Radius.circular(boundWidth / 10)),
                ),
              ),
              Container(
                height: boundWidth * 1 / 10,
                alignment: Alignment.center,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: AppColors.brown,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColors.gray, width: 2),
                      padding: EdgeInsets.only(
                          left: 10.0 + paddingWidth * 1 / 20,
                          right: 10.0 + paddingWidth * 1 / 20,
                          top: 2.0 + paddingWidth * 1 / 20,
                          bottom: 2.0 + paddingWidth * 1 / 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(boundWidth / 50)))),
                  onPressed: () {},
                  child: Text(
                    "Tải ảnh lên",
                    style: TextStyle(
                        color: AppColors.gray,
                        fontSize: boundWidth * 1 / 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  //controller: controllerUser,
                  keyboardType: TextInputType.text,
                  decoration:
                      textFieldInputDecoration("Tên món", "Tên món", "Error"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Loại: ",
                    style: TextStyle(
                      color: AppColors.brown,
                      fontSize: boundWidth / 25,
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: foodChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        foodChecked = value!;
                      });
                    },
                  ),
                  Text(
                    "Đồ ăn",
                    style: TextStyle(
                      color: AppColors.brown,
                      fontSize: boundWidth / 25,
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: drinkChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        drinkChecked = value!;
                      });
                    },
                  ),
                  Text(
                    "Đồ uống",
                    style: TextStyle(
                      color: AppColors.brown,
                      fontSize: boundWidth / 25,
                    ),
                  ),
                ],
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  //controller: controllerUser,
                  keyboardType: TextInputType.text,
                  decoration: textFieldInputDecoration("Giá", "Giá", "Error"),
                ),
              ),
              Container(
                width: boundWidth,
                child: TextField(
                  //controller: controllerUser,
                  keyboardType: TextInputType.text,
                  decoration:
                      textFieldInputDecoration("Mô tả", "Mô tả", "Error"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 40 + paddingWidth / 5,
                  bottom: 40 + paddingWidth / 5,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    //Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.blue,
                      side: BorderSide(color: AppColors.blue, width: 2),
                      padding: EdgeInsets.only(
                          left: 20.0 + paddingWidth * 1 / 20,
                          right: 20.0 + paddingWidth * 1 / 20,
                          top: 10.0 + paddingWidth * 1 / 20,
                          bottom: 10.0 + paddingWidth * 1 / 20),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  child: Text(
                    "Thêm món",
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: boundWidth * 1 / 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

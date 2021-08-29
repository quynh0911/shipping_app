import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/widgets/shipper_card.dart';
import 'package:flutter_application/screens/fakeData.dart';
import 'package:flutter_application/widgets/text_widget.dart';
import 'package:flutter_application/screens/users/address/local_widget/infor_address.dart';
import 'package:flutter_application/screens/users/address/choose_address.dart';
import 'package:flutter_application/models/address.dart';

void main() {
  runApp(AddAdressStart(
    address: new Address(
        latitude: 21.002853,
        longitude: 105.857845,
        name: "",
        phone: "",
        description: ""),
  ));
}

class AddAdressStart extends StatelessWidget {
  final Address address;
  const AddAdressStart({
    Key? key,
    required this.address,
  }) : super(key: key);

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
            "Địa chỉ nhận hàng",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: AddAdressState(
          address: this.address,
        ),
      ),
    );
  }
}

class AddAdressState extends StatefulWidget {
  final Address address;
  const AddAdressState({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  _AddAdressState createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdressState> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Address addAddress = widget.address;
    nameController.text = addAddress.name;
    phoneController.text = addAddress.phone;
    descriptionController.text = addAddress.description;
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 9 / 10;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 19 / 20;
    else
      boundWidth = screenWidth * 7 / 10;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: 5 + paddingWidth / 10,
              bottom: 5 + paddingWidth / 10,
              left: paddingWidth,
              right: paddingWidth),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  top: 5 + paddingWidth / 10,
                  bottom: 5 + paddingWidth / 10,
                ),
                child: Text(
                  "Danh sách địa chỉ:",
                  style: TextStyle(
                    fontSize: boundWidth * 1 / 20,
                    height: 1.5,
                    color: AppColors.brown,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 7 / 20,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      for (var item in FAKE_ADDRESSES)
                        InforAddressCard(address: item),
                    ],
                  ),
                ),
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 50 + paddingWidth / 10,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: boundWidth,
                        child: TextField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: textFieldInputDecoration(
                              "Họ và tên", "Họ và tên", ""),
                        ),
                      ),
                      Container(
                        width: boundWidth,
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.text,
                          decoration: textFieldInputDecoration(
                              "Số điện thoại", "Số điện thoại", ""),
                        ),
                      ),
                      widget.address.description == ""
                          ? Row(
                              children: [
                                Text(
                                  "Địa chỉ:",
                                  style: TextStyle(
                                    fontSize: boundWidth * 1 / 22,
                                    height: 1.5,
                                    color: AppColors.brown,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(width: boundWidth * 1 / 5),
                                Container(
                                  height: boundWidth * 3 / 20,
                                  alignment: Alignment.center,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        primary: AppColors.blue,
                                        backgroundColor: Colors.white,
                                        side: BorderSide(
                                            color: AppColors.blue, width: 2),
                                        padding: EdgeInsets.only(
                                            left: 10.0 + paddingWidth * 1 / 20,
                                            right: 10.0 + paddingWidth * 1 / 20,
                                            top: 5.0 + paddingWidth * 1 / 20,
                                            bottom:
                                                5.0 + paddingWidth * 1 / 20),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ChooseAddressStart(
                                                    address: widget.address,
                                                  )));
                                    },
                                    child: Text(
                                      "Thêm địa chỉ",
                                      style: TextStyle(
                                          color: AppColors.blue,
                                          fontSize: boundWidth * 1 / 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              width: boundWidth,
                              child: TextField(
                                controller: descriptionController,
                                keyboardType: TextInputType.text,
                                decoration: textFieldInputDecoration(
                                    "Mô tả địa chỉ", "Mô tả", ""),
                              ),
                            ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 40 + paddingWidth / 5,
                          bottom: 40 + paddingWidth / 5,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              addAddress.name = nameController.text;
                              addAddress.phone = phoneController.text;
                              addAddress.description =
                                  descriptionController.text;
                              FAKE_ADDRESSES.add(addAddress);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.blue,
                              side: BorderSide(color: AppColors.blue, width: 2),
                              padding: EdgeInsets.only(
                                  left: 20.0 + paddingWidth / 20,
                                  right: 20.0 + paddingWidth / 20,
                                  top: 10.0 + paddingWidth / 20,
                                  bottom: 10.0 + paddingWidth / 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(boundWidth / 20)))),
                          child: Text(
                            "Thêm địa chỉ",
                            style: TextStyle(
                              color: AppColors.yellow,
                              fontSize: boundWidth / 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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

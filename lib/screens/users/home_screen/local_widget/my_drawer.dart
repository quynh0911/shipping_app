import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application/data/apis/user_api.dart';
import 'package:flutter_application/models/address.dart';
import 'package:flutter_application/models/user.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/screens/users/address/add_address.dart';

class MyDrawer extends StatefulWidget {
  XFile? _imageFile;
  late User user;
  MyDrawer({required User user}) {
    this.user = user;
  }
  @override
  State<StatefulWidget> createState() {
    return MyDrawerState();
  }
}

class MyDrawerState extends State<MyDrawer> {
  final ImagePicker _picker = ImagePicker();
  bool isSeeInformation = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Tài khoản",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: getImage(),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                            );
                          },
                          child: Text(
                            "Tải ảnh lên",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shadowColor: Colors.white12,
                          ),
                        ),
                        Text(
                          // (widget.user.login == null) ? (widget.user.login!.length == 0)? widget.user.login : "Khách hàng",
                          "Khách hàng",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.blueAccent,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text('Thông tin tài khoản'),
                            leading: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Text(
                          "Tên KH: " +
                              widget.user.firstName +
                              " " +
                              widget.user.lastName,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Số ĐT: " + widget.user.phone),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Mật khẩu"),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAdressStart(
                                    address: new Address(
                                        latitude: 21.002853,
                                        longitude: 105.857845,
                                        name: "",
                                        phone: "",
                                        description: ""))));
                      },
                      child: ListTile(
                        title: Text('Địa chỉ nhận hàng'),
                        leading: Icon(
                          Icons.person_pin_circle,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.grey,
                        ),
                        title: Text("Setting"),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text("Chính sách và bảo mật"),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text("Đăng xuất"),
                  onPressed: logOut,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void logOut() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString("authtoken"));
    await sharedPreferences.remove("authtoken");
    Navigator.of(context).pushReplacementNamed(Routes.login);
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose profile photo",
            style: TextStyle(backgroundColor: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                  icon: Icon(CupertinoIcons.camera, color: Colors.grey),
                  label: Text("Camera")),
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    CupertinoIcons.photo,
                    color: Colors.grey,
                  ),
                  label: Text("Gallery")),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    var pickerFile = await _picker.pickImage(source: source, imageQuality: 50);
    UserApi userApi = UserApi();
    try {
      print(base64Encode(File(pickerFile!.path).readAsBytesSync()));
      widget.user.avatar = base64Encode(await pickerFile.readAsBytes());
      widget.user.login = "Hello";
      try {
        userApi.updateAvatar(widget.user);
      } on Exception catch (e) {}
    } catch (e) {}
    setState(() {
      widget._imageFile = pickerFile;
    });
  }

  ImageProvider getImage() {
    if (widget.user.avatar != null && widget.user.avatar!.length != 0) {
      return MemoryImage(base64Decode(widget.user.avatar!));
    }
    return AssetImage("assets/images/logo.png");
  }
}

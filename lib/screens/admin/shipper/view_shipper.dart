import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/data/apis/user_api.dart';
import 'package:flutter_application/utils/notification/notification_utils.dart';
import 'package:flutter_application/widgets/text_widget.dart';
import 'package:flutter_application/screens/admin/shipper/select_shipper.dart';
import 'package:flutter_application/models/user.dart';

class ViewShipperStart extends StatelessWidget {
  final User shipper;
  ViewShipperStart({
    required this.shipper,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Thêm Shipper",
          style: TextStyle(
            color: AppColors.yellow,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ViewShipperState(
        shipper: this.shipper,
      ),
    );
  }
}

class ViewShipperState extends StatefulWidget {
  final User shipper;
  ViewShipperState({
    required this.shipper,
    Key? key,
  }) : super(key: key);
  @override
  _ViewShipperState createState() => _ViewShipperState();
}

class _ViewShipperState extends State<ViewShipperState> {
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: 20 + paddingWidth / 5,
              bottom: 20 + paddingWidth / 5,
              left: paddingWidth,
              right: paddingWidth),
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  radius: boundWidth * 1 / 6,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
              ),
              Container(
                  height: boundWidth * 1 / 5,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: boundWidth * 1 / 16,
                        width: boundWidth * 0.18,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.blue,
                          )),
                          child: Text(
                            "Khóa",
                            style: TextStyle(
                              color: AppColors.yellow,
                              fontSize: boundWidth * 1 / 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: boundWidth * 1 / 16,
                        width: boundWidth * 1 / 20,
                      ),
                      SizedBox(
                        height: boundWidth * 1 / 16,
                        width: boundWidth * 0.18,
                        child: ElevatedButton(
                          onPressed: () async {
                            //xoá
                            try {
                              showConfirmDialog(
                                  "Xoá shipper",
                                  "Bạn có chắc chắn xoá shipper này?",
                                  deleteShipper,
                                  context);
                            } catch (e) {}
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.blue,
                          )),
                          child: Text(
                            "Xóa",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: boundWidth * 1 / 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              textView(context,
                  widget.shipper.firstName + " " + widget.shipper.lastName),
              textView(context, widget.shipper.phone),
              textView(context, widget.shipper.email),
              textView(context, widget.shipper.address!),
              Container(
                margin: EdgeInsets.only(
                  top: 40 + paddingWidth / 5,
                  bottom: 40 + paddingWidth / 5,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ShipperSelectStart()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.blue,
                      side: BorderSide(color: AppColors.blue, width: 2),
                      padding: EdgeInsets.only(
                          left: 40.0 + paddingWidth * 1 / 20,
                          right: 40.0 + paddingWidth * 1 / 20,
                          top: 10.0 + paddingWidth * 1 / 20,
                          bottom: 10.0 + paddingWidth * 1 / 20),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
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

  deleteShipper() async {
    UserApi userApi = UserApi();
    try {
      var res = await userApi.deleteUser(widget.shipper.login!);
      if (res.statusCode == 200) {
        showWarningDialog("Bạn đã xoá thành công shipper này", context);
      }
      Navigator.of(context).pop();
    } catch (e) {}
  }
}

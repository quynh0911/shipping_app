import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/data/apis/user_api.dart';
import 'package:flutter_application/models/user.dart';

import 'package:flutter_application/widgets/shipper_card.dart';
import 'package:flutter_application/screens/admin/shipper/add_shipper.dart';

void main() {
  runApp(ShipperSelectStart());
}

class ShipperSelectStart extends StatelessWidget {
  ShipperSelectStart({
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
          "Shipper",
          style: TextStyle(
            color: AppColors.yellow,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ShipperSelectState(),
      //bottomNavigationBar: AdminBottom(),
    );
  }
}

class ShipperSelectState extends StatefulWidget {
  ShipperSelectState({
    Key? key,
  }) : super(key: key);

  @override
  _ShipperSelectState createState() => _ShipperSelectState();
}

class _ShipperSelectState extends State<ShipperSelectState> {
  // late ShipperProvider _shipperProvider;

  // @override
  // void didChangeDependencies() {
  //   _shipperProvider = Provider.of(context);
  //   super.didChangeDependencies();
  // }
  late List<User> listShipper = [];
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
              Container(
                child: new TextField(
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
                    hintText: 'Tìm kiếm shipper',
                    fillColor: Colors.black,
                    contentPadding: EdgeInsets.only(
                        left: 10,
                        top: paddingWidth / 20,
                        bottom: paddingWidth / 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 13 / 20,
                  child: futureListViewCus()),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                ),
              ),
              Container(
                height: boundWidth * 1 / 5,
                alignment: Alignment.center,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: AppColors.blue,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColors.blue, width: 2),
                      padding: EdgeInsets.only(
                          left: 10.0 + paddingWidth * 1 / 20,
                          right: 10.0 + paddingWidth * 1 / 20,
                          top: 5.0 + paddingWidth * 1 / 20,
                          bottom: 5.0 + paddingWidth * 1 / 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(boundWidth / 10)))),
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddShipperStart()));
                    setState(() {});
                  },
                  child: Text(
                    "Thêm shipper",
                    style: TextStyle(
                        color: AppColors.blue,
                        fontSize: boundWidth * 1 / 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget futureListViewCus() {
    return FutureBuilder(
      builder: (context, shipperSnapShot) {
        print("Lấy danh sách tại start shipper");
        if (shipperSnapShot.connectionState == ConnectionState.none &&
                shipperSnapShot.hasData == false ||
            shipperSnapShot.data == null) {
          return SpinKitCircle(
            color: AppColors.blue,
            size: 50,
          );
        }
        return ListView.builder(
          itemCount: (shipperSnapShot.data as List<User>).length,
          itemBuilder: (context, index) {
            User project = (shipperSnapShot.data as List<User>)[index];
            return ShipperCard(
              shipper: project,
            );
          },
        );
      },
      future: fetchListShipper(),
    );
  }

  Future<List<User>> fetchListShipper() async {
    UserApi userApi = UserApi();
    listShipper = await userApi.getListShipper(0, 10);
    return listShipper;
  }
}

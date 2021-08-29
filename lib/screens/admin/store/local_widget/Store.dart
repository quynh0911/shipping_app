import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/data/apis/store_api.dart';
import 'package:flutter_application/models/store.dart';
import 'package:flutter_application/route.dart';
import 'package:flutter_application/screens/admin/addstore/local_widget/add_info_store.dart';
import 'package:flutter_application/widgets/store_information.dart';
import 'package:flutter_application/screens/admin/add_to_market/local/add_to_market.dart';

class StateStore extends StatefulWidget {
  @override
  _StateStore createState() => _StateStore();
}

class _StateStore extends State<StateStore> {
  List<ProductStore> listStore = [];

  @override
  void initState() {
    print("Gọi lại");

    super.initState();
  }

  Future<List<ProductStore>> fetchListStore() async {
    StoreApi storeApi = StoreApi();
    listStore = await storeApi.getAllStore();
    return listStore;
  }

  @override
  Widget build(BuildContext context) {
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
              top: 10 + paddingWidth / 10,
              bottom: 10 + paddingWidth / 10,
              left: paddingWidth,
              right: paddingWidth),
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                  fontSize: 12 + paddingWidth / 20,
                  color: Colors.black,
                ),
                controller: null,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    padding: EdgeInsets.only(bottom: 1.0),
                    icon: Icon(Icons.search,
                        color: Color.fromRGBO(9, 57, 180, 1)),
                    onPressed: () {},
                  ),
                  isDense: true,
                  hintText: 'Tìm kiếm cửa hàng',
                  fillColor: Colors.black,
                  contentPadding: EdgeInsets.only(
                      left: 10,
                      top: paddingWidth / 20,
                      bottom: paddingWidth / 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 11 / 20,
                child: futureListViewCus(),
              ),
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
                            builder: (context) => AddInfoStore()));
                    setState(() {});
                  },
                  child: Text(
                    "Thêm cửa hàng",
                    style: TextStyle(
                        color: AppColors.blue,
                        fontSize: boundWidth * 1 / 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
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
                  onPressed: () {
                    //Navigator.pushReplacementNamed(context, Routes.addToMarket);
                    Navigator.pushNamed(context, Routes.addToMarket);
                  },
                  child: Text(
                    "Thêm vào chợ",
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
      builder: (context, storeSnapShot) {
        print("Build lại danh sách");
        if (storeSnapShot.connectionState == ConnectionState.none &&
                storeSnapShot.hasData == false ||
            storeSnapShot.data == null) {
          return SpinKitCircle(
            color: AppColors.blue,
            size: 50,
          );
        }
        return ListView.builder(
          itemCount: (storeSnapShot.data as List<ProductStore>).length,
          itemBuilder: (context, index) {
            ProductStore project =
                (storeSnapShot.data as List<ProductStore>)[index];
            return StoreInformation(
              productStore: project,
            );
          },
        );
      },
      future: fetchListStore(),
    );
  }
}

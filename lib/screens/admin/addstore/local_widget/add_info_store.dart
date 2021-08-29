import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application/constances/strings.dart';
import 'package:flutter_application/models/address.dart';

import 'package:flutter_application/providers/store_provider/store_provider.dart';
import 'package:flutter_application/route.dart';

import 'package:flutter_application/screens/users/address/choose_address.dart';

import 'package:flutter_application/widgets/text_widget.dart';
import 'package:flutter_application/constances/colors.dart';

main(List<String> args) {
  runApp(
    AddInfoStore(
        // address: new Address(
        //     latitude: 0, longitude: 0, name: "", phone: "", description: ""),
        ),
  );
}

class AddInfoStore extends StatelessWidget {
  // final Address address;
  // const AddInfoStore({
  //   Key? key,
  //   required this.address,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   home:
        ChangeNotifierProvider(
      create: (_) => StoreProvide(),
      child: Scaffold(
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
            "Thêm cửa hàng",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Body(
            // address: this.address,
            ),
      ),
      // ),
    );
  }
}

class Body extends StatefulWidget {
  // final Address address;
  // const Body({
  //   Key? key,
  //   required this.address,
  // }) : super(key: key);
  @override
  _BodyState createState() {
    return _BodyState();
  }
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  late TextEditingController _openTimeController;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController _closeTimeController;
  late TextEditingController addressController;
  late StoreProvide _storeProvide;
  String district = "Chọn huyện";

  Address address = Address(
      latitude: 3, longitude: 12, name: "name", phone: "096", description: "");
  String _valueToOpenTime = "";
  String _valueToCloseTime = "";

  double lat = 0.0;
  double long = 0.0;
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    _openTimeController = TextEditingController(text: '$lsHour:$lsMinute');
    _closeTimeController = TextEditingController(text: '$lsHour:$lsMinute');
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController(text: address.description);
  }

  @override
  void didChangeDependencies() {
    _storeProvide = Provider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // address = widget.address;
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 19 / 20;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 9 / 10;
    else
      boundWidth = screenWidth * 7 / 10;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return Form(
      key: _oFormKey,
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
                child: TextField(
                  controller: nameController,
                  decoration: textFieldInputDecoration(
                      "Tên cửa hàng", "Tên cửa hàng", _storeProvide.name.error,
                      leadingicon: Icon(Icons.store_mall_directory)),
                  onChanged: (value) {
                    _storeProvide.changeName(value);
                  },
                ),
              ),
              Container(
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: textFieldInputDecoration("Số điện thoại",
                      "Số điện thoại", _storeProvide.name.error,
                      leadingicon: Icon(Icons.phone)),
                  onChanged: (value) {
                    _storeProvide.changePhone(value);
                  },
                ),
              ),
              Container(
                //open time
                child: DateTimePicker(
                  controller: _openTimeController,
                  type: DateTimePickerType.time,
                  // initialValue: '', //_initialValue,
                  icon: Icon(Icons.access_time),
                  timeLabelText: "Thời gian mở cửa",
                  use24HourFormat: true,
                  onChanged: (val) => setState(() => _valueToOpenTime = val),
                  validator: (val) {
                    setState(() => _valueToOpenTime = val ?? '');
                    _storeProvide.changeOpenTime(val ?? '');
                    return null;
                  },
                  onSaved: (val) =>
                      setState(() => _valueToOpenTime = val ?? ''),
                ),
              ),
              Container(
                //close time
                child: DateTimePicker(
                  type: DateTimePickerType.time,
                  controller: _closeTimeController,
                  icon: Icon(Icons.access_time),
                  timeLabelText: "Thời gian đóng cửa",
                  use24HourFormat: true,
                  onChanged: (val) => setState(() => _valueToCloseTime = val),
                  validator: (val) {
                    setState(() => _valueToCloseTime = val ?? '');
                    _storeProvide.changecloseTime(val ?? '');
                    return null;
                  },
                  onSaved: (val) =>
                      setState(() => _valueToCloseTime = val ?? ''),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Huyện",
                      style: TextStyle(fontSize: boundWidth * 1 / 25),
                    ),
                    DropdownButton<String>(
                      hint: Text(district),
                      items: provinceBG.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: boundWidth * 1 / 25,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          district = value!;
                          _storeProvide.changeDistrict(value);
                          print(_storeProvide.district!);
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mô tả: ",
                    style: TextStyle(
                      fontSize: boundWidth * 1 / 25,
                    ),
                  ),
                  Container(
                    child: Visibility(
                      visible: !_storeProvide.haveAddress,
                      child: Container(
                        child: TextButton(
                            onPressed: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ChooseAddressStart(
                                            address: address,
                                          )));
                              _storeProvide.changeBool();
                            },
                            child: Text("Thêm địa chỉ")),
                      ),
                    ),
                  ),
                  Container(
                    child: Visibility(
                      child: Flexible(
                        child: TextField(
                          controller:
                              TextEditingController(text: address.description),
                          decoration:
                              textFieldInputDecoration("Mô tả địa chỉ", "", ""),
                        ),
                      ),
                      visible: _storeProvide.haveAddress,
                    ),
                  ),
                  Container(
                    child: Visibility(
                      visible: _storeProvide.haveAddress,
                      child: TextButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ChooseAddressStart(
                                        address: address,
                                      )));
                          setState(() {});
                        },
                        child: Text(
                          "Chỉnh sửa",
                          style: TextStyle(
                            fontSize: boundWidth * 1 / 25,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                margin: EdgeInsets.only(
                  top: 40 + paddingWidth / 5,
                  bottom: 40 + paddingWidth / 5,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    print(nameController.text);
                    print(_closeTimeController.text);
                    print(address.latitude);
                    print(address.longitude);
                    print(address.description);
                    print(phoneController.text);
                    print(_openTimeController.text);
                    _storeProvide.changeName(nameController.text);
                    _storeProvide.changeDistrict(district);
                    _storeProvide.changePhone(phoneController.text);
                    _storeProvide.changeLatLon(address.latitude,
                        address.longitude, address.description);
                    _storeProvide.changeOpenTime(_openTimeController.text);
                    _storeProvide.changecloseTime(_closeTimeController.text);
                    print(_storeProvide.name.error);
                    print(_storeProvide.phone.error);
                    if (_storeProvide.isValid()) {
                      print("valid true");
                      _storeProvide.submit(
                          nameController.text, phoneController.text, district);
                      await _storeProvide.createStore();
                      Navigator.pop(context);
                    }
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
                    "Thêm cửa hàng",
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

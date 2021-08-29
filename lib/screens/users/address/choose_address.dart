import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application/widgets/text_widget.dart';
import 'package:flutter_application/screens/users/address/add_address.dart';
import 'package:flutter_application/models/address.dart';

void main() {
  runApp(ChooseAddressStart(
    address: new Address(
        latitude: 21.002853,
        longitude: 105.857845,
        name: "",
        phone: "",
        description: ""),
  ));
}

class ChooseAddressStart extends StatelessWidget {
  final Address address;
  const ChooseAddressStart({
    Key? key,
    required this.address,
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
          "Chọn địa chỉ",
          style: TextStyle(
            color: AppColors.yellow,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ChooseAddressState(
        address: this.address,
      ),
    );
  }
}

class ChooseAddressState extends StatefulWidget {
  final Address address;
  const ChooseAddressState({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  _ChooseAddressState createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddressState> {
  @override
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  late GoogleMapController mapController;

  late Position _currentPosition;
  String _currentAddress = '';

  final chosenAddressController = TextEditingController();
  final chosenAddressDescriptionController = TextEditingController();
  final chosenAddressFocusNode = FocusNode();
  String _chosenAddress = '';

  Set<Marker> markers = {};

  late Address addAddress;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        addAddress = widget.address;
      });
      //await _getAddress();
      await _getCurrentAddress(addAddress);
    }).catchError((e) {
      print(e);
    });
  }

  // Hàm thêm địa điểm và marker cho điểm được chọn
  Future<bool> _chooseAddressMarker() async {
    try {
      // Retrieving placemarks from addresses
      List<Location> chosenPlacemark =
          await locationFromAddress(_chosenAddress);
      addAddress.description = _chosenAddress;

      addAddress.latitude = _chosenAddress == _currentAddress
          ? _currentPosition.latitude
          : chosenPlacemark[0].latitude;

      addAddress.longitude = _chosenAddress == _currentAddress
          ? _currentPosition.longitude
          : chosenPlacemark[0].longitude;
      _getCurrentAddress(addAddress);

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Method for retrieving the address
  _getCurrentAddress(Address add) async {
    try {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              add.latitude,
              add.longitude,
            ),
            zoom: 16.0,
          ),
        ),
      );
      markers.clear();
      markers.add(Marker(
        markerId: MarkerId(add.phone),
        position: LatLng(add.latitude, add.longitude),
        infoWindow: InfoWindow(
          title: add.description,
          snippet: add.name,
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      setState(() {
        chosenAddressController.text = add.description;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Widget build(BuildContext context) {
    addAddress = widget.address;
    double screenWidth = MediaQuery.of(context).size.width;
    double boundWidth = 0;
    if (screenWidth < 400)
      boundWidth = screenWidth * 1.0;
    else if (screenWidth < 600)
      boundWidth = screenWidth * 1.0;
    else
      boundWidth = screenWidth * 7 / 10;
    double paddingWidth = (screenWidth - boundWidth) / 2;
    return SafeArea(
      child: Container(
        child: Scaffold(
          key: _scaffoldKey,
          body: Stack(
            children: <Widget>[
              // Map View
              GoogleMap(
                markers: Set<Marker>.from(markers),
                initialCameraPosition: _initialLocation,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                onTap: (value) {
                  mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(value.latitude, value.longitude),
                        zoom: 16.0,
                      ),
                    ),
                  );
                  markers.clear();
                  markers.add(Marker(
                    markerId: MarkerId(_currentAddress),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(
                      title: _currentAddress,
                      snippet: "Test",
                    ),
                    icon: BitmapDescriptor.defaultMarker,
                  ));
                  setState(() {
                    addAddress.latitude = value.latitude;
                    addAddress.longitude = value.longitude;
                    chosenAddressController.text = _currentAddress;
                    _chosenAddress = _currentAddress;
                  });
                },
              ),
              // Khu vực 3 button, zoom in zoom out và current location
              SafeArea(
                child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ClipOval(
                              child: Material(
                                color: AppColors.blue, // button color
                                child: InkWell(
                                  splashColor: AppColors.blue, // inkwell color
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(Icons.add),
                                  ),
                                  onTap: () {
                                    mapController.animateCamera(
                                      CameraUpdate.zoomIn(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            ClipOval(
                              child: Material(
                                color: AppColors.blue, // button color
                                child: InkWell(
                                  splashColor: AppColors.blue, // inkwell color
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(Icons.remove),
                                  ),
                                  onTap: () {
                                    mapController.animateCamera(
                                      CameraUpdate.zoomOut(),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        ClipOval(
                          child: Material(
                            color: Colors.orange.shade100, // button color
                            child: InkWell(
                              splashColor: Colors.orange, // inkwell color
                              child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Icon(Icons.my_location),
                              ),
                              onTap: () {
                                addAddress.latitude = _currentPosition.latitude;
                                addAddress.longitude =
                                    _currentPosition.longitude;
                                addAddress.description = "";
                                _getCurrentAddress(addAddress);
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              // Khu vực tìm kiếm địa điểm
              SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      width: boundWidth * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Container(
                              child: new TextField(
                                onChanged: (value) {
                                  setState(() {
                                    _chosenAddress = value;
                                  });
                                },
                                style: TextStyle(
                                  fontSize: 12 + paddingWidth / 20,
                                  color: AppColors.blue,
                                ),
                                //controller: controllerUser,
                                controller: chosenAddressController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    padding: EdgeInsets.only(bottom: 1.0),
                                    icon: Icon(Icons.search,
                                        color: Color.fromRGBO(9, 57, 180, 1)),
                                    onPressed: (_chosenAddress != '')
                                        ? () async {
                                            FocusNode();
                                            setState(() {
                                              markers.clear();
                                            });
                                            _chooseAddressMarker();
                                          }
                                        : null,
                                  ),
                                  isDense: true,
                                  labelText: 'Tìm kiếm địa chỉ',
                                  hintText: 'Nhập địa chỉ tìm kiếm',
                                  fillColor: Colors.black,
                                  contentPadding: EdgeInsets.only(
                                      left: 10,
                                      top: paddingWidth / 20,
                                      bottom: paddingWidth / 20),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Khu vực mô tả và chọn địa điểm
              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      width: boundWidth * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: boundWidth,
                              child: TextField(
                                //controller: controllerUser,
                                controller: chosenAddressDescriptionController,
                                keyboardType: TextInputType.text,
                                decoration: textFieldInputDecoration(
                                    "Mô tả địa điểm", "Mô tả", ""),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(
                                top: 10 + paddingWidth / 5,
                                bottom: 10 + paddingWidth / 5,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  addAddress.description =
                                      chosenAddressDescriptionController.text;
                                  widget.address.latitude = addAddress.latitude;
                                  widget.address.longitude =
                                      addAddress.longitude;
                                  Navigator.pop(context);

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (BuildContext context) =>
                                  //             AddAdressStart(
                                  //                 address: addAddress)));
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.blue,
                                    side: BorderSide(
                                        color: AppColors.blue, width: 2),
                                    padding: EdgeInsets.only(
                                        left: 20.0 + paddingWidth * 1 / 20,
                                        right: 20.0 + paddingWidth * 1 / 20,
                                        top: 10.0 + paddingWidth * 1 / 20,
                                        bottom: 10.0 + paddingWidth * 1 / 20),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)))),
                                child: Text(
                                  "Chọn địa điểm",
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

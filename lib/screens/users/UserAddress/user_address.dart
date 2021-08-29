import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application/utils/map_service/getLongLat.dart';

class UserAddress extends StatefulWidget {
  @override
  _UserAddressState createState() {
    return _UserAddressState();
  }
}

class _UserAddressState extends State<UserAddress> {
  bool isLoading = false;
  int i = 0;
  var _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  late Marker _marker;
  final Map<String, Marker> _markers = <String, Marker>{};
  late GoogleMapController _mapController;
  late Position _position;
  GetLongLatCurrent _getLongLatCurrent = GetLongLatCurrent();
  @override
  void initState() {
    super.initState();
    getPosition();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading == false)
        ? MaterialApp(
            home: Container(
              color: Colors.white,
              child: Center(
                child: SpinKitCircle(
                  color: Colors.blueAccent,
                  size: 50,
                ),
              ),
            ),
          )
        : MaterialApp(
            home: Scaffold(
              key: _scaffoldKey1,
              body: Container(
                  constraints: BoxConstraints.expand(),
                  color: Colors.white,
                  child: Stack(children: <Widget>[
                    GoogleMap(
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(_position.latitude, _position.longitude),
                        zoom: 18,
                      ),
                      markers: Set<Marker>.of(_markers.values),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          AppBar(
                            backgroundColor: Colors.white,
                            elevation: 0.0,
                            title: Text(
                              "Thêm địa chỉ",
                              style: TextStyle(color: Colors.black),
                            ),
                            // actions: <Widget>[Image.asset("ic_notify.png")],
                          ),
                        ],
                      ),
                    ),
                  ])),
            ),
          );
  }

  void getPosition() async {
    _position = await _getLongLatCurrent.determinePosition();
    _marker = Marker(
        markerId: MarkerId(
          "hi",
        ),
        // position: LatLng(_position.latitude, _position.longitude)
        position: LatLng(20.8876692, 105.9282194));
    _markers["hi"] = _marker;

    isLoading = true;
    setState(() {});
  }
}

main(List<String> args) {
  runApp(UserAddress());
}

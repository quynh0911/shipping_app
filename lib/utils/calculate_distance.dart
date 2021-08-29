import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/widgets/text_widget.dart';

import 'dart:math' show cos, sqrt, asin;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            "Tính toán giá tiền",
            style: TextStyle(
              color: AppColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: MapView(),
      ),
    );
  }
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  double _placeDistance = 0;

  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance(
      double _startLatitude,
      double _startLongtitude,
      double _endLatitude,
      double _endLongtitude) async {
    try {
      double startLatitude = _startLatitude;
      double startLongitude = _startLongtitude;

      double destinationLatitude = _endLatitude;
      double destinationLongitude = _endLongtitude;

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      setState(() {
        _placeDistance = totalDistance;
        print('DISTANCE: ${totalDistance.toStringAsFixed(2)} km');
      });

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBYnusIZv5GreCEoAzpZHlGwjnrwcAfD00", // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    super.initState();
  }

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
              top: 5 + paddingWidth / 10,
              bottom: 5 + paddingWidth / 10,
              left: paddingWidth,
              right: paddingWidth),
          child: Column(
            children: [
              textView(context, _placeDistance.toString() + " km"),
              Container(
                margin: EdgeInsets.only(
                  top: 40 + paddingWidth / 5,
                  bottom: 40 + paddingWidth / 5,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _calculateDistance(
                        21.001633, 105.856970, 21.011033, 105.852817);
                    setState(() {});
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
                    "Tính quãng đường",
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

import 'package:flutter/material.dart';
import 'package:flutter_application/constances/colors.dart';
import 'package:flutter_application/screens/users/address/choose_address.dart';
import 'package:flutter_application/models/address.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_application/utils/launch_map/maps_sheet.dart';

class InforAddressCard extends StatelessWidget {
  final Address address;
  const InforAddressCard({
    Key? key,
    required this.address,
  }) : super(key: key);

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
    return Container(
      margin: EdgeInsets.only(
        top: 1 + paddingWidth / 10,
        bottom: 1 + paddingWidth / 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(
                  left: boundWidth * 1 / 40,
                  right: boundWidth * 1 / 40,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: boundWidth > 400
                                ? boundWidth * 1 / 2
                                : boundWidth * 2 / 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  this.address.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: boundWidth * 1 / 30,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  this.address.phone,
                                  style: TextStyle(
                                    fontSize: boundWidth * 1 / 30,
                                    height: 1.5,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: boundWidth * 1 / 12,
                            width: boundWidth * 1 / 6,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ChooseAddressStart(
                                              address: this.address,
                                            )));
                              },
                              child: Text(
                                "Sửa",
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: boundWidth * 1 / 25,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: boundWidth * 1 / 12,
                            child: TextButton(
                              onPressed: () {
                                MapsSheet.show(
                                  context: context,
                                  onMapTap: (map) {
                                    map.showMarker(
                                      coords: Coords(
                                          address.latitude, address.longitude),
                                      title: address.description,
                                      zoom: 20,
                                    );
                                  },
                                );
                              },
                              child: Text(
                                this.address.description,
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: boundWidth * 1 / 30,
                                  decoration: TextDecoration.underline,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: boundWidth * 1 / 12,
                            width: boundWidth * 3 / 20,
                            child: IconButton(
                              padding: EdgeInsets.only(bottom: 1.0),
                              icon: Icon(
                                Icons.delete,
                                color: AppColors.gray,
                                size: boundWidth * 1 / 15,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: paddingWidth * 1 / 10),
                    ]),
              )),
            ]),
      ),
    );
  }
}

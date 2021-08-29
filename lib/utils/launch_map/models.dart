import 'package:flutter_application/utils/launch_map/map_launcher.dart';
import 'package:flutter_application/utils/launch_map/utils.dart';

enum MapType {
  apple,
  google,
  googleGo,
  amap,
  here,
}

class Coords {
  final double latitude;
  final double longitude;

  Coords(this.latitude, this.longitude);
}

class AvailableMap {
  String mapName;
  MapType mapType;
  String icon;

  AvailableMap({
    required this.mapName,
    required this.mapType,
    required this.icon,
  });

  static AvailableMap? fromJson(json) {
    final MapType? mapType =
        Utils.enumFromString(MapType.values, json['mapType']);
    if (mapType != null) {
      return AvailableMap(
        mapName: json['mapName'],
        mapType: mapType,
        icon: 'packages/map_launcher/assets/icons/${json['mapType']}.svg',
      );
    } else {
      return null;
    }
  }

  Future<void> showMarker({
    required Coords coords,
    required String title,
    String? description,
    int? zoom,
    Map<String, String>? extraParams,
  }) {
    return MapLauncher.showMarker(
      mapType: mapType,
      coords: coords,
      title: title,
      description: description,
      zoom: zoom,
      extraParams: extraParams,
    );
  }
}

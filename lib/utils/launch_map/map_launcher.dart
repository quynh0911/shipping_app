import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_application/utils/launch_map/marker_url.dart';
import 'package:flutter_application/utils/launch_map/utils.dart';
import 'package:flutter_application/utils/launch_map/models.dart';

class MapLauncher {
  static const MethodChannel _channel = const MethodChannel('map_launcher');

  static Future<List<AvailableMap>> get installedMaps async {
    final maps = await _channel.invokeMethod('getInstalledMaps');
    return List<AvailableMap>.from(
      maps.map((map) => AvailableMap.fromJson(map)),
    );
  }

  @Deprecated('use showMarker instead')
  static Future<dynamic> launchMap({
    required MapType mapType,
    required Coords coords,
    required String title,
    String? description,
  }) {
    return showMarker(
      mapType: mapType,
      coords: coords,
      title: title,
      description: description,
    );
  }

  static Future<dynamic> showMarker({
    required MapType mapType,
    required Coords coords,
    required String title,
    String? description,
    int? zoom,
    Map<String, String>? extraParams,
  }) async {
    final String url = getMapMarkerUrl(
      mapType: mapType,
      coords: coords,
      title: title,
      description: description,
      zoom: zoom,
      extraParams: extraParams,
    );

    final Map<String, String?> args = {
      'mapType': Utils.enumToString(mapType),
      'url': Uri.encodeFull(url),
      'title': title,
      'description': description,
      'latitude': coords.latitude.toString(),
      'longitude': coords.longitude.toString(),
    };
    return _channel.invokeMethod('showMarker', args);
  }
}

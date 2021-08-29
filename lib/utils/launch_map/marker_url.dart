import 'dart:io';
import 'package:flutter_application/utils/launch_map/utils.dart';
import 'package:flutter_application/utils/launch_map/models.dart';

String getMapMarkerUrl({
  required MapType mapType,
  required Coords coords,
  String? title,
  String? description,
  int? zoom,
  Map<String, String>? extraParams,
}) {
  final zoomLevel = zoom ?? 16;
  switch (mapType) {
    case MapType.google:
      return Utils.buildUrl(
        url: Platform.isIOS ? 'comgooglemaps://' : 'geo:0,0',
        queryParams: {
          'q': '${coords.latitude},${coords.longitude}($title)',
          'zoom': '$zoomLevel',
          ...(extraParams ?? {}),
        },
      );

    case MapType.googleGo:
      return Utils.buildUrl(
        url: 'http://maps.google.com/maps',
        queryParams: {
          'q': '${coords.latitude},${coords.longitude}($title)',
          'zoom': '$zoomLevel',
          ...(extraParams ?? {}),
        },
      );

    case MapType.amap:
      return Utils.buildUrl(
        url: '${Platform.isIOS ? 'ios' : 'android'}amap://viewMap',
        queryParams: {
          'sourceApplication': 'map_launcher',
          'poiname': '$title',
          'lat': '${coords.latitude}',
          'lon': '${coords.longitude}',
          'zoom': '$zoomLevel',
          'dev': '0',
          ...(extraParams ?? {}),
        },
      );

    case MapType.apple:
      return Utils.buildUrl(
        url: 'http://maps.apple.com/maps',
        queryParams: {
          'saddr': '${coords.latitude},${coords.longitude}',
          ...(extraParams ?? {}),
        },
      );

    case MapType.here:
      return Utils.buildUrl(
        url:
            'https://share.here.com/l/${coords.latitude},${coords.longitude},$title',
        queryParams: {
          'z': '$zoomLevel',
          ...(extraParams ?? {}),
        },
      );
  }
}

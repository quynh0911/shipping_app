import 'package:flutter_application/utils/launch_map/models.dart';

class Utils {
  static String? enumToString(o) {
    if (o == null) return null;
    return o.toString().split('.').last;
  }

  static T enumFromString<T>(Iterable<T> values, String? value) {
    return values
        .firstWhere((type) => type.toString().split('.').last == value);
  }

  static String? nullOrValue(dynamic nullable, String value) {
    if (nullable == null) return null;
    return value;
  }

  static String buildUrl({
    required String url,
    required Map<String, String?> queryParams,
  }) {
    return queryParams.entries.fold('$url?', (dynamic previousValue, element) {
      if (element.value == null || element.value == '') {
        return previousValue;
      }
      return '$previousValue&${element.key}=${element.value}';
    }).replaceFirst('&', '');
  }
}

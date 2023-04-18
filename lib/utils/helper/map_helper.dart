class MapHelper {
  static T? get<T>(Map? map, dynamic key, {T? defaultValue}) {
    if(map == null) {
      return defaultValue;
    }

    switch(T) {
      case int:
        return (dynamicToInt(map[key]) as T) ?? defaultValue;
      case double:
        return (dynamicToDouble(map[key]) as T) ?? defaultValue;
      case String:
        return (dynamicToString(map[key]) as T) ?? defaultValue;
      default:
        return map[key]?.runtimeType == T ? map[key] : defaultValue;
    }
  }

  static bool containsKey<T>(Map? map, dynamic key) {
    if(map == null) {
      return false;
    }

    switch(T) {
      case int:
        return (dynamicToInt(map[key]) as T) != null;
      case double:
        return (dynamicToDouble(map[key]) as T) != null;
      case String:
        return (dynamicToString(map[key]) as T) != null;
      default:
        return map.containsKey(key);
    }
  }

  static List<T> getList<T>(Map<String, dynamic> map, dynamic key,
      T Function(Map<String, dynamic> map) convert) {
    final results = <T>[];

    final list = map[key];
    if (list is List) {
      for (final obj in list) {
        T value;
        if(obj is Map<String, dynamic>) {
          value = convert(obj);
        } else {
          switch(T) {
            case int:
              value = dynamicToInt(obj) as T;
              results.add(value);
              break;
            case double:
              value = dynamicToDouble(obj) as T;
              results.add(value);
              break;
            case String:
              value = dynamicToString(obj) as T;
              results.add(value);
              break;
            case bool:
              value = dynamicToBool(obj) as T;
              results.add(value);
              break;
          }
        }
      }
    }

    return results;
  }

  static Map? getMap(Map? map, String key, {Map? defaultValue}) {
    if(map == null) {
      return defaultValue;
    }
    final value = map[key];
    if(value is Map) {
      return value;
    }
    return defaultValue;
  }

  static T? getObject<T>(Map? map, String key, T Function(Map map) convert) {
    if (map != null) {
      final value = map[key];
      if (value is Map) {
        return convert(value);
      }
    }
    return null;
  }

  static DateTime getDateTime(Map? map, String key) {
    final value = dynamicToInt(map != null ? map[key] : null);
    return DateTime.fromMillisecondsSinceEpoch(value);
  }

  static int dynamicToInt(dynamic value) {
    if (value is int) {
      return value;
    } else if(value is double) {
      return value.toInt();
    } else if(value is String) {
      return int.tryParse(value) ?? 0;
    } else {
      return 0;
    }
  }

  static double dynamicToDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if(value is int) {
      return value.toDouble();
    } else if(value is String) {
      return double.tryParse(value) ?? 0;
    } else {
      return 0;
    }
  }

  static String dynamicToString(dynamic value) {
    if (value is String) {
      return value;
    } else {
      return value?.toString() ?? '';
    }
  }

  static bool dynamicToBool(dynamic value) {
    if (value is bool) {
      return value;
    } else {
      return false;
    }
  }
}

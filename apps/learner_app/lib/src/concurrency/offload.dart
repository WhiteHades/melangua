import 'dart:convert';

import 'package:flutter/foundation.dart';

Map<String, dynamic> parseJsonMap(String source) {
  return jsonDecode(source) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> parseJsonMapInBackground(String source) {
  return compute(parseJsonMap, source);
}

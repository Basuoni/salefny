import 'dart:developer';

import 'package:salefny/app/core/utils/constants.dart';

String getAssetPath(dynamic image) {
  try {
    final map = image as Json;
    if (map['folder'] == null ||
        map['folder'].toString().isEmpty ||
        map['title'] == null ||
        map['title'].toString().isEmpty) return '';
    return 'https://cdn.arkaniaeg.com/${map['folder']}/${map['title']}';
    // ignore: avoid_catches_without_on_clauses
  } catch (e, s) {
    log(e.toString(), name: ' getAssetPath ', stackTrace: s);
    return 'https://upload.wikimedia.org/wikipedia/commons/1/10/Empire_State_Building_with_1WTC_in_background.png';
  }
}

import 'dart:io';

import 'package:salefny/app/core/utils/call_launch_url.dart';

String getStoreUrl() {
  if (Platform.isAndroid) {
    return 'https://play.google.com/store/apps/details?id=com.arkaniaeg.app';
  } else if (Platform.isIOS) {
    return 'https://apps.apple.com/app/id1225570693'; // TODO: change app id for ios
  } else {
    return ' https://arkaniaeg.com';
  }
}

Future<void> storeRedirect() async {
  if (Platform.isAndroid || Platform.isIOS) {
    await callLaunchUrl(url: getStoreUrl());
  }
}

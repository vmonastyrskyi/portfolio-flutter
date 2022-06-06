import 'package:flutter/painting.dart';

import 'app_resources.dart';
import 'preload_image.dart';

Future<void> preloadResources() async {
  await Future.wait([
    preloadImage(const AssetImage(AppResources.home)),
    preloadImage(const AssetImage(AppResources.about)),
    preloadImage(const AssetImage(AppResources.skills)),
    preloadImage(const AssetImage(AppResources.workAscii)),
    preloadImage(const AssetImage(AppResources.workTelegram)),
    preloadImage(const AssetImage(AppResources.workNotes)),
    preloadImage(const AssetImage(AppResources.workElecar)),
  ]);
}

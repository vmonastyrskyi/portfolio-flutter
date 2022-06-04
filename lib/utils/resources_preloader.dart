import 'package:flutter/painting.dart';

import 'app_resources.dart';
import 'preload_image.dart';

Future<void> preloadResources() async {
  await Future.wait([
    preloadImage(const AssetImage(AppResources.home)),
    preloadImage(const AssetImage(AppResources.about)),
    preloadImage(const AssetImage(AppResources.skills)),
    preloadImage(const AssetImage(AppResources.work1)),
    preloadImage(const AssetImage(AppResources.work2)),
    preloadImage(const AssetImage(AppResources.work3)),
    preloadImage(const AssetImage(AppResources.work4)),
    preloadImage(const AssetImage(AppResources.work5)),
  ]);
}
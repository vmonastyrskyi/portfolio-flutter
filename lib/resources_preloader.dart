import 'package:flutter/painting.dart';

import 'app_resources.dart';
import 'utils/preload_image.dart';

Future<void> preloadResources() async {
  await Future.wait([
    preloadImage(const AssetImage(AppResources.home)),
    preloadImage(const AssetImage(AppResources.about)),
    preloadImage(const AssetImage(AppResources.skills)),
  ]);
}

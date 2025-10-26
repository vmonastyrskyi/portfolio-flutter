import 'package:flutter/painting.dart';

import 'app_resources.dart';
import 'preload_image.dart';

Future<void> preloadResources() async {
  await Future.wait([
    preloadImage(const AssetImage(AppResources.aboutMe)),
    preloadImage(const AssetImage(AppResources.projectsCrpto)),
    preloadImage(const AssetImage(AppResources.projectsNotes)),
    preloadImage(const AssetImage(AppResources.projectsTelegram)),
  ]);
}

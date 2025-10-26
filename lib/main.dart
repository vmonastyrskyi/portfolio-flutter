import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/utils/resources_preloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      minimumFetchInterval: const Duration(hours: 1),
      fetchTimeout: const Duration(minutes: 1),
    ),
  );
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await preloadResources();

  runApp(const PortfolioApp());
}

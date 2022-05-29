import 'package:flutter/material.dart';

import 'components/home_page.dart';
import 'resources_preloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await preloadResources();

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Portfolio',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

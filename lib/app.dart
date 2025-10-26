import 'package:flutter/material.dart';
import 'package:portfolio/components/home_page.dart';
import 'package:portfolio/components/theme/themes.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

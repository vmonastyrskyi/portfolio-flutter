import 'package:flutter/material.dart';
import 'package:portfolio/components/sections/about/about_section.dart';
import 'package:portfolio/components/sections/home/home_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<Widget> _sections = [
    HomeSection(),
    AboutSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, navBarHeight),
        child: NavBar(),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.25,
          child: ScrollablePositionedList.builder(
            itemBuilder: (_, index) => _sections[index],
            itemCount: _sections.length,
          ),
        ),
      ),
    );
  }
}

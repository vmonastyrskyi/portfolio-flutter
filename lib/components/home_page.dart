import 'package:flutter/material.dart';
import 'package:portfolio/components/sections/about/about_section.dart';
import 'package:portfolio/components/sections/home/home_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'nav_bar.dart';
import 'sections/skills/skills_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Widget> _sections = [
    HomeSection(),
    AboutSection(),
    SkillsSection(),
  ];

  @override
  Widget build(BuildContext context) {
    final bodyWidth = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width / 1.25);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, navBarHeight),
        child: NavBar(),
      ),
      body: Center(
        child: ScrollablePositionedList.builder(
          padding: EdgeInsets.symmetric(horizontal: bodyWidth / 2.0),
          itemBuilder: (_, index) => _sections[index],
          itemCount: _sections.length,
        ),
      ),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'nav_bar.dart';
import 'sections/about/about_section.dart';
import 'sections/home/home_section.dart';
import 'sections/skills/skills_section.dart';
import 'sections/works/works_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Widget> _sections = [
    HomeSection(),
    AboutSection(),
    SkillsSection(),
    WorksSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, navBarHeight),
        child: NavBar(),
      ),
      body: Center(
        child: ScrollablePositionedList.builder(
          itemBuilder: (_, index) => _sections[index],
          itemCount: _sections.length,
        ),
      ),
    );
  }
}

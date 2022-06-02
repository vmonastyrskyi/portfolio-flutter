import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'nav_bar.dart';
import 'sections/about/about_section.dart';
import 'sections/footer/footer.dart';
import 'sections/home/home_section.dart';
import 'sections/skills/skills_section.dart';
import 'sections/work/work_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _sections = [
    SkillsSection(),
    HomeSection(),
    AboutSection(),
    WorkSection(),
    Footer(),
  ];

  final ItemScrollController _itemScrollController = ItemScrollController();

  final ValueNotifier<int> _sectionIndexNotifier = ValueNotifier(-1);

  @override
  void initState() {
    super.initState();
    _sectionIndexNotifier.addListener(() {
      if (_sectionIndexNotifier.value != -1) {
        _itemScrollController.scrollTo(
          index: _sectionIndexNotifier.value,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, navBarHeight),
        child: NavBar(sectionIndexNotifier: _sectionIndexNotifier),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is UserScrollNotification) {
            _sectionIndexNotifier.value = -1;
          }
          return true;
        },
        child: ScrollablePositionedList.builder(
          itemScrollController: _itemScrollController,
          itemBuilder: (_, index) => _sections[index],
          itemCount: _sections.length,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sectionIndexNotifier.dispose();
    super.dispose();
  }
}

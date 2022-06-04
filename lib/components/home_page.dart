import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'nav_bar.dart';
import 'sections/about/about_section.dart';
import 'sections/contact/contact_section.dart';
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
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();
  final ValueNotifier<int> _sectionIndexNotifier = ValueNotifier(0);

  late final List<Widget> _sections = [
    HomeSection(sectionIndexNotifier: _sectionIndexNotifier),
    const AboutSection(),
    const SkillsSection(),
    const WorkSection(),
    const ContactSection(),
    const Footer(),
  ];

  int get trailingIndex {
    return _itemPositionsListener.itemPositions.value
        .where((position) => position.itemTrailingEdge > 0)
        .reduce((min, position) =>
            position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
        .index;
  }

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
          if (notification is ScrollEndNotification) {
            final metrics = notification.metrics;

            if (metrics.pixels != 0 && metrics.atEdge) {
              _sectionIndexNotifier.value = _sections.length - 2;
              return true;
            }

            _sectionIndexNotifier.value = trailingIndex;
          }
          return true;
        },
        child: ScrollablePositionedList.builder(
          itemScrollController: _itemScrollController,
          itemPositionsListener: _itemPositionsListener,
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

import 'package:flutter/material.dart';
import 'package:portfolio/components/nav_bar.dart';
import 'package:portfolio/components/sections/about/about_section.dart';
import 'package:portfolio/components/sections/contact/contact_section.dart';
import 'package:portfolio/components/sections/footer/footer.dart';
import 'package:portfolio/components/sections/home/home_section.dart';
import 'package:portfolio/components/sections/projects/projects_section.dart';
import 'package:portfolio/components/sections/skills/skills_section.dart';
import 'package:portfolio/components/theme/app_colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
    const ProjectsSection(),
    const SkillsSection(),
    const ContactSection(),
    const Footer(),
  ];

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
      backgroundColor: context.appColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, navBarHeight),
        child: NavBar(sectionIndexNotifier: _sectionIndexNotifier),
      ),
      body: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemPositionsListener: _itemPositionsListener,
        itemBuilder: (_, index) => _sections[index],
        itemCount: _sections.length,
      ),
    );
  }

  @override
  void dispose() {
    _sectionIndexNotifier.dispose();
    super.dispose();
  }
}

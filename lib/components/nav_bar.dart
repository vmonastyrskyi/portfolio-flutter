import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';

const double navBarHeight = 72.0;

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.sectionIndexNotifier});

  final ValueNotifier<int> sectionIndexNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: navBarHeight,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0.0, 1.0),
            blurRadius: 4.0,
          ),
        ],
        color: context.appColors.surfaceColor,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024.0),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () => _navigateToPage(0),
                child: Text(
                  AppStrings.name,
                  style: TextStyle(
                    color: context.appColors.primaryTextColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                  ),
                ),
              ),
              const Spacer(),
              ValueListenableBuilder(
                valueListenable: sectionIndexNotifier,
                builder: (_, value, _) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _NavBarTab(
                        onPressed: () => _navigateToPage(0),
                        selected: value == 0,
                        labelText: 'Home',
                      ),
                      _NavBarTab(
                        onPressed: () => _navigateToPage(1),
                        selected: value == 1,
                        labelText: 'About',
                      ),
                      _NavBarTab(
                        onPressed: () => _navigateToPage(2),
                        selected: value == 2,
                        labelText: 'Projects',
                      ),
                      _NavBarTab(
                        onPressed: () => _navigateToPage(3),
                        selected: value == 3,
                        labelText: 'Skills',
                      ),
                      _NavBarTab(
                        onPressed: () => _navigateToPage(4),
                        selected: value == 4,
                        labelText: 'Contact',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToPage(int pageIndex) {
    sectionIndexNotifier.value = pageIndex;
  }
}

class _NavBarTab extends StatelessWidget {
  const _NavBarTab({
    required this.onPressed,
    required this.labelText,
    required this.selected,
  });

  final VoidCallback onPressed;
  final String labelText;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        foregroundColor: context.appColors.primaryTextColor,
        backgroundColor: Colors.transparent,
      ),
      child: Text(
        labelText,
        style: TextStyle(
          fontFamily: 'Poppins',
          color: context.appColors.primaryTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

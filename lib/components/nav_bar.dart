import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';

import 'shared_widgets/separated_row.dart';

const double navBarHeight = 72.0;

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.sectionIndexNotifier,
  });

  final ValueNotifier<int> sectionIndexNotifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: navBarHeight,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(146, 161, 176, 0.15),
            offset: Offset(0.0, 1.0),
            blurRadius: 4.0,
          ),
        ],
        color: Colors.white,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024.0),
          child: Row(
            children: [
              const Text(
                AppStrings.name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
              const Spacer(),
              ValueListenableBuilder(
                valueListenable: sectionIndexNotifier,
                builder: (_, value, __) {
                  return SeparatedRow(
                    separator: const SizedBox(width: 48.0),
                    children: [
                      _NavBarTab(
                        onPressed: () => _navigateToPage(0),
                        selected: value == 0,
                        label: 'Home',
                      ),
                      _NavBarTab(
                        onPressed: () => _navigateToPage(1),
                        selected: value == 1,
                        label: 'About',
                      ),
                      _NavBarTab(
                        onPressed: () => _navigateToPage(2),
                        selected: value == 2,
                        label: 'Skills',
                      ),
                      _NavBarTab(
                        onPressed: () => _navigateToPage(3),
                        selected: value == 3,
                        label: 'Work',
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

class _NavBarTab extends StatefulWidget {
  const _NavBarTab({
    Key? key,
    required this.onPressed,
    required this.selected,
    required this.label,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool selected;
  final String label;

  @override
  _NavBarTabState createState() => _NavBarTabState();
}

class _NavBarTabState extends State<_NavBarTab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..addListener(() => setState(() {}));

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        curve: Curves.easeInOutCubic,
        parent: _animationController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        _buildLabel(),
        Positioned(
          top: 32.0,
          left: 0.0,
          right: 0.0,
          height: 2.0,
          child: Transform.scale(
            scaleX: !widget.selected ? _scaleAnimation.value : 1.0,
            child: Container(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel() {
    return InkWell(
      onTap: widget.onPressed,
      onHover: (hovered) {
        hovered
            ? _animationController.forward()
            : _animationController.reverse();
      },
      child: Text(
        widget.label,
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: AppColors.secondary,
        ),
      ),
    );
  }
}

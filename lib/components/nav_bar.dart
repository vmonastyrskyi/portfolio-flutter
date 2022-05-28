import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';

import 'shared_widgets/separated_row.dart';

const double navBarHeight = 72.0;

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
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
            children: const [
              Text(
                '{Name}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
              Spacer(),
              SeparatedRow(
                separator: SizedBox(width: 48.0),
                children: [
                  _NavBarTab(label: 'Home'),
                  _NavBarTab(label: 'About'),
                  _NavBarTab(label: 'Skills'),
                  _NavBarTab(label: 'Work'),
                  _NavBarTab(label: 'Contact'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarTab extends StatefulWidget {
  const _NavBarTab({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  _NavBarTabState createState() => _NavBarTabState();
}

class _NavBarTabState extends State<_NavBarTab> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        _buildLabel(),
        Visibility(
          visible: _hovered,
          child: Positioned(
            top: 32.0,
            left: 0.0,
            right: 0.0,
            height: 2.0,
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
      onTap: () {},
      onHover: (hovered) {
        setState(() => _hovered = hovered);
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

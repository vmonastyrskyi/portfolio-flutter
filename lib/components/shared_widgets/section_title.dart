import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';

class SectionTitleText extends StatelessWidget {
  const SectionTitleText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: context.appColors.primaryColor,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
            fontSize: 32.0,
          ),
        ),
        Positioned(
          left: 12.0,
          right: 12.0,
          bottom: -3.0,
          child: Container(color: context.appColors.primaryColor, height: 3.0),
        ),
      ],
    );
  }
}

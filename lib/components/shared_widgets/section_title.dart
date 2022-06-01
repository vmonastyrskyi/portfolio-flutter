import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class SectionTitleText extends StatelessWidget {
  const SectionTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        Positioned(
          left: 12.0,
          right: 12.0,
          bottom: -3.0,
          child: Container(
            height: 3.0,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

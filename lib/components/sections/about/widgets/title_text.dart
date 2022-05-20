import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Text(
          'About',
          style: TextStyle(
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

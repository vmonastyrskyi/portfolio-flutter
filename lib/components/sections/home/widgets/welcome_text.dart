import 'package:flutter/material.dart';
import 'package:portfolio/app_colors.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Hi,\nI\'am ',
        style: TextStyle(
          fontSize: 48.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          color: AppColors.secondary,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '{Name}',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          TextSpan(text: '\nMobile Developer'),
        ],
      ),
    );
  }
}

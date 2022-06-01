import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
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
                  text: AppStrings.firstName,
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 48.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: AppColors.secondary,
            ),
            child: AnimatedTextKit(
              pause: const Duration(seconds: 3),
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  AppStrings.profession,
                  speed: const Duration(milliseconds: 75),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

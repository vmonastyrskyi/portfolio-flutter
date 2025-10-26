import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: 'Hi,\nI\'am ',
              style: TextStyle(
                color: context.appColors.primaryTextColor,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                fontSize: 48.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: AppStrings.name,
                  style: TextStyle(color: context.appColors.primaryColor),
                ),
              ],
            ),
          ),
          DefaultTextStyle(
            style: TextStyle(
              color: context.appColors.primaryTextColor,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              fontSize: 48.0,
            ),
            child: AnimatedTextKit(
              pause: const Duration(seconds: 3),
              repeatForever: true,
              animatedTexts: <AnimatedText>[
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

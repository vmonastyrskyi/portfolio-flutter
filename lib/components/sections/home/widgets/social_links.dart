import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/custom_icon_button.dart';
import 'package:portfolio/components/shared_widgets/delayed_fade_in.dart';
import 'package:portfolio/utils/app_icons.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/utils/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.0,
      children: <Widget>[
        DelayedFadeIn(
          delay: const Duration(milliseconds: 0),
          offset: const Offset(0.0, -1.5),
          child: CustomIconButton(
            onPressed: () => UrlLauncher.toUrl(AppStrings.linkedinUrl),
            backgroundColor: const Color(0xFF0A66C2),
            icon: AppIcons.linkedin,
            size: 40.0,
          ),
        ),
        DelayedFadeIn(
          delay: const Duration(milliseconds: 250),
          offset: const Offset(0.0, -1.5),
          child: CustomIconButton(
            onPressed: () => UrlLauncher.toUrl(AppStrings.githubUrl),
            backgroundColor: const Color(0xFF2b3137),
            icon: AppIcons.github,
            size: 40.0,
          ),
        ),
      ],
    );
  }
}

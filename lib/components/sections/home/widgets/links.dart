import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/custom_icon_button.dart';
import 'package:portfolio/components/shared_widgets/delayed_fade_in.dart';
import 'package:portfolio/components/shared_widgets/separated_row.dart';
import 'package:portfolio/utils/app_icons.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/utils/url_launcher.dart';

class Links extends StatelessWidget {
  const Links({super.key});

  @override
  Widget build(BuildContext context) {
    return SeparatedRow(
      separator: const SizedBox(width: 12.0),
      children: [
        DelayedFadeIn(
          delay: const Duration(milliseconds: 0),
          offset: const Offset(0.0, -1.5),
          child: CustomIconButton(
            onPressed: () => UrlLauncher.toUrl(AppStrings.linkedinUrl),
            width: 40.0,
            height: 40.0,
            icon: AppIcons.linkedin,
          ),
        ),
        DelayedFadeIn(
          delay: const Duration(milliseconds: 250),
          offset: const Offset(0.0, -1.5),
          child: CustomIconButton(
            onPressed: () => UrlLauncher.toUrl(AppStrings.githubUrl),
            width: 40.0,
            height: 40.0,
            icon: AppIcons.github,
          ),
        ),
      ],
    );
  }
}

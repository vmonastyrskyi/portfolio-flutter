import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/delayed_fade_in.dart';
import 'package:portfolio/components/shared_widgets/section_title.dart';

import 'widgets/about_text.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 56.0, 0.0, 32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024.0),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SectionTitleText(title: 'About Me'),
              SizedBox(height: 64.0),
              DelayedFadeIn(
                delay: Duration(milliseconds: 250),
                offset: Offset(0.0, -0.25),
                child: AboutText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

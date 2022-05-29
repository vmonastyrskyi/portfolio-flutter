import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/delayed_fade_in.dart';

import 'widgets/avatar.dart';
import 'widgets/contact_button.dart';
import 'widgets/links.dart';
import 'widgets/welcome_text.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 88.0, 0.0, 32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DelayedFadeIn(
                      delay: const Duration(milliseconds: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          WelcomeText(),
                          SizedBox(height: 40.0),
                          ContactButton(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80.0),
                    const Links(),
                  ],
                ),
              ),
              const SizedBox(width: 96.0),
              const DelayedFadeIn(
                delay: Duration(milliseconds: 0),
                child: Avatar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

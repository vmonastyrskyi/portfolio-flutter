import 'package:flutter/material.dart';

import 'widgets/avatar.dart';
import 'widgets/contact_button.dart';
import 'widgets/links.dart';
import 'widgets/welcome_text.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 96.0, 0.0, 32.0),
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
                  children: const [
                    WelcomeText(),
                    SizedBox(height: 40.0),
                    ContactButton(),
                    SizedBox(height: 80.0),
                    Links(),
                  ],
                ),
              ),
              const SizedBox(width: 96.0),
              const Avatar(),
            ],
          ),
        ),
      ),
    );
  }
}

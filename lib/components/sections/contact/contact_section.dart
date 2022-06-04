import 'package:flutter/material.dart';
import 'package:portfolio/components/shared_widgets/section_title.dart';

import 'widgets/contact_form.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 56.0, 0.0, 88.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1024.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SectionTitleText(title: 'Contact'),
              const SizedBox(height: 64.0),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420.0),
                child: ContactForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/app_icons.dart';
import 'package:portfolio/components/shared_widgets/custom_icon_button.dart';
import 'package:portfolio/components/shared_widgets/separated_row.dart';

class Links extends StatelessWidget {
  const Links({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SeparatedRow(
      separator: const SizedBox(width: 12.0),
      children: [
        CustomIconButton(
          onPressed: () {},
          width: 40.0,
          height: 40.0,
          icon: AppIcons.linkedin,
        ),
        CustomIconButton(
          onPressed: () {},
          width: 40.0,
          height: 40.0,
          icon: AppIcons.github,
        ),
      ],
    );
  }
}

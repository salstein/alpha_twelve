import 'package:alpha_twelve/src/style/theme/theme.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: context.bodyLarge?.medium
          .copyWith(fontFamily: AlphaTypography.ibmPlexMono()),
    );
  }
}
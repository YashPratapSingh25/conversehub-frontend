import 'package:conversehub/features/auth/widgets/feature_box.dart';
import 'package:flutter/material.dart';

class FeaturesRow extends StatelessWidget {
  final ColorScheme colorScheme;
  const FeaturesRow({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FeatureBox(
          imagePath: "assets/images/job-interview.png",
          imageLabel: "Interview Mode",
          colorScheme: colorScheme,
        ),
        const SizedBox(width: 12),
        FeatureBox(
          imagePath: "assets/images/debate.png",
          imageLabel: "Debate Mode",
          colorScheme: colorScheme,
        ),
        const SizedBox(width: 12),
        FeatureBox(
          imagePath: "assets/images/presentation.png",
          imageLabel: "Present Mode",
          colorScheme: colorScheme,
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}

import 'package:conversehub/features/auth/widgets/feature_box.dart';
import 'package:flutter/material.dart';

class FeaturesRow extends StatelessWidget {
  const FeaturesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FeatureBox(
          imagePath: "assets/images/job-interview.png",
          imageLabel: "Interview Mode",
        ),
        SizedBox(width: 12),
        FeatureBox(
          imagePath: "assets/images/debate.png",
          imageLabel: "Debate Mode",
        ),
        SizedBox(width: 12),
        FeatureBox(
          imagePath: "assets/images/presentation.png",
          imageLabel: "Present Mode",
        ),
        SizedBox(width: 12),
      ],
    );
  }
}

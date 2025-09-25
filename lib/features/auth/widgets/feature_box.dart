import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final String imagePath;
  final String imageLabel;
  final ColorScheme colorScheme;
  const FeatureBox({super.key, required this.imagePath, required this.imageLabel, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 8),
            Text(
              imageLabel,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

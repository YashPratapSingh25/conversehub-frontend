import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final ColorScheme colorScheme;
  const AppTitle({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "ConverseHub",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.2,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Practice • Learn • Improve",
          style: TextStyle(
            fontSize: 16,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

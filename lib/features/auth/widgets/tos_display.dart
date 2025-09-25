import 'package:flutter/material.dart';

class TosDisplay extends StatelessWidget {
  final ColorScheme colorScheme;
  const TosDisplay({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Text(
        "By signing in, you agree to our Terms of Service",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: colorScheme.tertiary,
        ),
      ),
    );
  }
}

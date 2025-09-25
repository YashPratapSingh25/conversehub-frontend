import 'package:flutter/material.dart';

class LogoWithBgCircle extends StatelessWidget {
  final ColorScheme colorScheme;
  const LogoWithBgCircle({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.5),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Image.asset(
        "assets/images/app_logo.png",
        width: 80,
        height: 80,
      ),
    );
  }
}

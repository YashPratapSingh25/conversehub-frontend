import 'package:flutter/material.dart';
import 'features_row.dart';
import 'google_auth_button.dart';

class FeaturesCardWithAuth extends StatelessWidget {
  final ColorScheme colorScheme;
  const FeaturesCardWithAuth({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.brightness == Brightness.light ?
                colorScheme.shadow.withOpacity(0.2):
                Colors.transparent,
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Welcome to ConverseHub! Practice, learn, and improve your communication skills.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: colorScheme.tertiary,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 32),

          FeaturesRow(colorScheme: colorScheme,),

          const SizedBox(height: 32),

          GoogleAuthButton()
        ],
      ),
    );
  }
}

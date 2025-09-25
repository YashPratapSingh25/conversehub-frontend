import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/auth_provider.dart';
import 'features_row.dart';
import 'google_auth_button.dart';

class FeaturesCardWithAuth extends StatelessWidget {
  const FeaturesCardWithAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          Text(
            "Welcome Back!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "Welcome to ConverseHub! Practice, learn, and improve your communication skills.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.4,
            ),
          ),

          SizedBox(height: 32),

          FeaturesRow(),

          SizedBox(height: 32),

          GoogleAuthButton()
        ],
      ),
    );
  }
}

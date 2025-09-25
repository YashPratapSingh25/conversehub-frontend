import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/auth_provider.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {
          final authProvider = Provider.of<AuthProvider>(context, listen: false);
          authProvider.login();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          elevation: 0,
        ),
        icon: Image.asset(
          "assets/images/google_logo.png",
          height: 24,
          width: 24,
        ),
        label: const Text(
          "Sign in with Google",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

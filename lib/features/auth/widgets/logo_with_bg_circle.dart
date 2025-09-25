import 'package:flutter/material.dart';

class LogoWithBgCircle extends StatelessWidget {
  const LogoWithBgCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        "assets/images/app_logo.png",
        width: 100,
        height: 100,
      ),
    );
  }
}

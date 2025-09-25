import 'package:flutter/material.dart';

class TosDisplay extends StatelessWidget {
  const TosDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Text(
        "By signing in, you agree to our Terms of Service",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white70,
        ),
      ),
    );
  }
}

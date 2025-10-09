import 'package:flutter/material.dart';

class AlertDialogHeader extends StatelessWidget {
  final String heading;
  const AlertDialogHeader({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

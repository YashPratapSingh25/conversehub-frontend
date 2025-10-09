import 'package:flutter/material.dart';

class EmptySessionCard extends StatelessWidget {
  final ColorScheme _colorScheme;
  final String _text;
  const EmptySessionCard({
    super.key,
    required ColorScheme colorScheme,
    required String text
  }) : _colorScheme = colorScheme, _text = text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _colorScheme.outline.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        _text,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _colorScheme.onSurface
        ),
        textAlign: TextAlign.center,
      ),
    );;
  }
}

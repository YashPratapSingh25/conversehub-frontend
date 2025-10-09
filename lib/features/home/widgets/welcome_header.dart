import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/home_provider.dart';

class WelcomeHeader extends StatelessWidget {
  final ColorScheme _colorScheme;
  final String _heading;
  final String? _subheading;
  const WelcomeHeader({
    super.key,
    required ColorScheme colorScheme,
    required String heading,
    String? subheading
  }) : _colorScheme = colorScheme, _heading = heading, _subheading = subheading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _heading,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: _colorScheme.onSurface,
          ),
        ),
        if (_subheading != null) ...[
          const SizedBox(height: 8),
          Text(
            _subheading!,
            style: TextStyle(
              fontSize: 16,
              color: _colorScheme.tertiary,
            ),
          ),
        ],
      ],
    );
  }
}

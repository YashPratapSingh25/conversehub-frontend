import 'package:flutter/material.dart';

class HomePageAppbar extends StatelessWidget {
  final ColorScheme _colorScheme;
  const HomePageAppbar({super.key, required ColorScheme colorScheme}) : _colorScheme = colorScheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _colorScheme.surface,
      elevation: 1,
      title: Text(
        'ConverseHub',
        style: TextStyle(
          color: _colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Profile action
          },
          icon: Icon(Icons.account_circle, color: _colorScheme.onSurface),
        ),
      ],
    );
  }
}

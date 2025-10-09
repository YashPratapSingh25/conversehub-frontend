import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:conversehub/features/home/widgets/interview_quick_start_button.dart';
import 'package:flutter/material.dart';

class QuickStartSection extends StatelessWidget {
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;
  const QuickStartSection({
    super.key,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider
  }) : _colorScheme = colorScheme, _homeProvider = homeProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Start',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 16),

        InterviewQuickStartButton(colorScheme: _colorScheme, homeProvider: _homeProvider),
      ],
    );
  }
}

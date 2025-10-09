import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:conversehub/features/home/widgets/session_modal_option.dart';
import 'package:flutter/material.dart';

class ModeChooserModalBottomSheet extends StatelessWidget {
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;
  const ModeChooserModalBottomSheet({
    super.key,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider
  }) : _colorScheme = colorScheme, _homeProvider = homeProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            "Choose Session Mode",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 24),
          SessionModalOption(
            title: "Interview",
            icon: Icons.work,
            mode: "interview",
            colorScheme: _colorScheme,
            homeProvider: _homeProvider,
          ),
          const SizedBox(height: 12),
          SessionModalOption(
            title: "Debate (Coming Soon)",
            icon: Icons.forum_rounded,
            mode: "debate",
            colorScheme: _colorScheme,
            homeProvider: _homeProvider,
          ),
          const SizedBox(height: 12),
          SessionModalOption(
            title: "Presentation (Coming Soon)",
            icon: Icons.co_present_rounded,
            mode: "interview",
            colorScheme: _colorScheme,
            homeProvider: _homeProvider,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

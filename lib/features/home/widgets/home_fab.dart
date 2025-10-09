import 'package:conversehub/features/home/widgets/mode_chooser_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../application/home_provider.dart';

class HomeFab extends StatelessWidget {
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;
  const HomeFab({super.key, required ColorScheme colorScheme, required HomeProvider homeProvider})
      : _colorScheme = colorScheme, _homeProvider = homeProvider;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: _colorScheme.surface,
          builder: (context) {
            return ModeChooserModalBottomSheet(colorScheme: _colorScheme, homeProvider : _homeProvider);
          },
        );
      },
      backgroundColor: _colorScheme.primary,
      label: const Text("Start Session"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      icon: const Icon(Icons.add_comment_rounded),
    );
  }
}

class _SessionOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final ColorScheme colorScheme;
  final VoidCallback onTap;

  const _SessionOption({
    required this.title,
    required this.icon,
    required this.colorScheme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: colorScheme.primary, size: 28),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_rounded,
                color: colorScheme.outline, size: 16),
          ],
        ),
      ),
    );
  }
}

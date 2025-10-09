import 'package:conversehub/core/ui_helpers/get_heading.dart';
import 'package:conversehub/core/ui_helpers/get_icon.dart';
import 'package:conversehub/features/home/widgets/alert_dialog_skeleton.dart';
import 'package:flutter/material.dart';

import '../application/home_provider.dart';

class SessionModalOption extends StatelessWidget {
  // replace the hardcoded values with ui helpers
  final String _title;
  final IconData _icon;
  final String _mode;
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;

  const SessionModalOption({
    super.key,
    required String title,
    required IconData icon,
    required String mode,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider
  }) : _title = title, _icon = icon, _mode = mode, _colorScheme = colorScheme,
        _homeProvider = homeProvider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialogSkeleton(
              colorScheme: _colorScheme,
              homeProvider: _homeProvider,
              mode: _mode
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(_icon, color: _colorScheme.primary, size: 28),
            const SizedBox(width: 16),
            Text(
              _title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: _colorScheme.outline, size: 16
            ),
          ],
        ),
      ),
    );
  }
}

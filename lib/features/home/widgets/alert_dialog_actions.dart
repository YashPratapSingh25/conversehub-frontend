import 'dart:async';

import 'package:flutter/material.dart';
import '../application/home_provider.dart';

List<Widget> alertDialogActions(
    {required BuildContext context,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider,
    required FutureOr<void> Function() onConfirm,
    required FutureOr<void> Function() onCancel,
    required String confirmLabel,
    required String cancelLabel}) {
  return [
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary
      ),
        onPressed: () async { await onConfirm(); },
        child: Text(confirmLabel)
    ),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.error,
        foregroundColor: colorScheme.onPrimary
      ),
      onPressed: () async { await onCancel();},
      child: const Text("Cancel")
    )
  ];
}
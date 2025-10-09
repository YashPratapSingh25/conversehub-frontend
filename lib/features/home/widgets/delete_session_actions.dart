import 'package:conversehub/features/home/domain/session_schema.dart';
import 'package:conversehub/features/home/widgets/alert_dialog_actions.dart';
import 'package:flutter/material.dart';

import '../application/home_provider.dart';

List<Widget> deleteSessionActions(
    final BuildContext context,
    final HomeProvider homeProvider,
    final ColorScheme colorScheme,
    final SessionSchema session
) {
  return alertDialogActions(
      context: context,
      colorScheme: colorScheme,
      homeProvider: homeProvider,
      onConfirm: () => _handleDelete(context, homeProvider, session),
      onCancel: () => _handleCancel(context),
      confirmLabel: "Delete",
      cancelLabel: "Cancel"
  );
}

Future <void> _handleDelete(
  BuildContext context,
  HomeProvider homeProvider,
  SessionSchema session
) async{
  await homeProvider.deleteSession(session.id);
  if(!context.mounted) return;
  Navigator.pop(context);
}

void _handleCancel(BuildContext context){
  Navigator.pop(context);
}
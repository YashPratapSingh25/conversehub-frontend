import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:flutter/material.dart';
import 'alert_dialog_actions.dart';

List<Widget> interviewAlertDialogActions(
  final BuildContext context,
  final HomeProvider homeProvider,
  final ColorScheme colorScheme,
){
  return alertDialogActions(
      context: context,
      colorScheme: colorScheme,
      homeProvider: homeProvider,
      onConfirm: () async {
        await _handleContinue(context, homeProvider, colorScheme);
      },
      onCancel: () {
        _handleCancel(context, homeProvider);
      },
      confirmLabel: "Continue",
      cancelLabel: "Cancel"
  );
}

Future<void> _handleContinue(
    BuildContext context,
    HomeProvider homeProvider,
    ColorScheme colorScheme
) async {
  if (homeProvider.sessionName == null || homeProvider.sessionName!.trim().isEmpty) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Session name can't be empty",
          style: TextStyle(color: colorScheme.onError)
        ),
        backgroundColor: colorScheme.errorContainer),
    );
    return;
  }

  String message = await homeProvider.addSession("interview");
  if (!context.mounted) return;
  if(homeProvider.isLoading == false){
    Navigator.pop(context);
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: message == "Session Created" ?
          colorScheme.onPrimary :
          colorScheme.onError)
      ),
      backgroundColor: message == "Session Created" ?
      colorScheme.primary :
      colorScheme.error
    ),
  );
}

void _handleCancel(BuildContext context, HomeProvider homeProvider){
  homeProvider.clearAll();
  Navigator.pop(context);
}
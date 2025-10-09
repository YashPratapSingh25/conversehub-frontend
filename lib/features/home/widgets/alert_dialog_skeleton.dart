import 'package:conversehub/features/home/widgets/delete_session_actions.dart';
import 'package:conversehub/features/home/widgets/file_picker_container.dart';
import 'package:conversehub/features/home/widgets/job_desc_text_field.dart';
import 'package:conversehub/features/home/widgets/alert_dialog_header.dart';
import 'package:conversehub/features/home/widgets/session_name_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/ui_helpers/get_heading.dart';
import '../application/home_provider.dart';
import 'alert_dialog_actions.dart';
import 'interview_alert_dialog_actions.dart';
import 'interview_alert_dialog_content.dart';

class AlertDialogSkeleton extends StatelessWidget {
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;
  final String _mode;
  final dynamic _data;
  const AlertDialogSkeleton({
    super.key,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider,
    required String mode,
    dynamic data
  }) : _colorScheme = colorScheme, _homeProvider = homeProvider, _mode = mode, _data = data;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        if (homeProvider.isLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        return AlertDialog(
          title:  AlertDialogHeader(heading: getHeading(_mode)),
          content: SizedBox(
            width: 400,
            child: _getContent(_mode, _colorScheme, homeProvider)
          ),
          actions: _getActions(context, _mode, _colorScheme, _homeProvider, _data),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
        );
      },
    );
  }
}

Widget? _getContent(String mode, ColorScheme colorScheme, HomeProvider homeProvider){
  if(mode == "interview"){
    return InterviewAlertDialogContent(colorScheme: colorScheme, homeProvider: homeProvider,);
  }
  if(mode == "deleteSession"){
    return const Text("Are you sure you want to delete this session ?");
  }
  return null;
}

List<Widget> _getActions(
  BuildContext context,
  String mode,
  ColorScheme colorScheme,
  HomeProvider homeProvider,
  dynamic data
){
  if(mode == "interview"){
    return interviewAlertDialogActions(context, homeProvider, colorScheme);
  }
  if(mode == "deleteSession"){
    return deleteSessionActions(context, homeProvider, colorScheme, data);
  }
  return [];
}
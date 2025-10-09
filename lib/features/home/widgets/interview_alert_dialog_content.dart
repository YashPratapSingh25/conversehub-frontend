import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:conversehub/features/home/widgets/session_name_text_field.dart';
import 'package:flutter/material.dart';

import 'file_picker_container.dart';
import 'job_desc_text_field.dart';

class InterviewAlertDialogContent extends StatelessWidget {
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;
  const InterviewAlertDialogContent({
    super.key,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider
  }) : _colorScheme = colorScheme, _homeProvider = homeProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SessionNameTextField(),

        const SizedBox(height: 16,),

        FilePickerContainer(colorScheme: _colorScheme,),

        const SizedBox(height: 16,),

        const JobDescTextField(),
      ],
    );
  }
}

import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionNameTextField extends StatelessWidget {
  const SessionNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return TextField(
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          onChanged: homeProvider.updateSessionName,
          maxLines: 1,
          decoration: const InputDecoration(
            label: Text(
              "Session Name",
            ),
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobDescTextField extends StatelessWidget {
  const JobDescTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return TextField(
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          onChanged: homeProvider.updateJobDesc,
          maxLines: 3,
          decoration: const InputDecoration(
            label: Text(
              "Job Description (Optional)",
            ),
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

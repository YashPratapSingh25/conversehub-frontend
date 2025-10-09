import 'package:conversehub/features/home/application/home_provider.dart';
import 'package:conversehub/features/home/widgets/alert_dialog_skeleton.dart';
import 'package:flutter/material.dart';

class InterviewQuickStartButton extends StatelessWidget {
  final ColorScheme _colorScheme;
  final HomeProvider _homeProvider;
  const InterviewQuickStartButton({
    super.key,
    required ColorScheme colorScheme,
    required HomeProvider homeProvider
  }) : _colorScheme = colorScheme, _homeProvider = homeProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialogSkeleton(
              colorScheme: _colorScheme,
              homeProvider: _homeProvider,
              mode: "interview",
            );
          },
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: _colorScheme.primary.withOpacity(0.75),
            borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                "assets/images/job-interview.png",
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Start Interview Practice',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Practice to ace your next interview.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

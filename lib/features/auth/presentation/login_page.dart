import 'package:conversehub/features/auth/widgets/app_title.dart';
import 'package:conversehub/features/auth/widgets/features_card_with_auth.dart';
import 'package:conversehub/features/auth/widgets/logo_with_bg_circle.dart';
import 'package:conversehub/features/auth/widgets/tos_display.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWithBgCircle(colorScheme: colorScheme),

            const SizedBox(height: 32),

            AppTitle(colorScheme: colorScheme),

            const SizedBox(height: 60),

            FeaturesCardWithAuth(colorScheme: colorScheme),

            const SizedBox(height: 48),

            TosDisplay(colorScheme: colorScheme,)
          ],
        ),
      ),
    );
  }
}
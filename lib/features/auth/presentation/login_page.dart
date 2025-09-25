import 'package:conversehub/features/auth/widgets/app_title.dart';
import 'package:conversehub/features/auth/widgets/features_card_with_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../application/auth_provider.dart';
import '../widgets/logo_with_bg_circle.dart';
import '../widgets/tos_display.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWithBgCircle(),

            SizedBox(height: 30),

            AppTitle(),

            SizedBox(height: 50),

            FeaturesCardWithAuth(),

            SizedBox(height: 40),

            TosDisplay(),
          ],
        ),
      ),
    );
  }
}
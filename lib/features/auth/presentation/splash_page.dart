import 'package:conversehub/features/auth/widgets/logo_with_bg_circle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../application/auth_provider.dart';
import '../widgets/app_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.autoLogin();
    });
    super.initState();
  }

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
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

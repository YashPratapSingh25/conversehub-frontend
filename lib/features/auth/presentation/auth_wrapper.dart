import 'package:conversehub/features/auth/presentation/login_page.dart';
import 'package:conversehub/features/auth/presentation/splash_page.dart';
import 'package:conversehub/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/auth_provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.isLoading){
          return SplashPage();
        }
        return authProvider.isLoggedIn ? HomePage() : LoginPage();
      },
    );
  }
}

import 'package:agricrops/enums/auth_status_enum.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/screens/auth/signin/signin.dart';
import 'package:agricrops/screens/error/error.dart';
import 'package:agricrops/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    switch (authProvider.authStatus) {
      case AuthStatus.uninitialized:
      case AuthStatus.unauthenticated:
      case AuthStatus.authenticating:
        return const SigninScreen();
      case AuthStatus.authenticated:
        return const HomeScreen();
      case AuthStatus.authError:
        return ErrorScreen(
          title: 'Authentication Error',
          message: authProvider.authErrorMsg,
          action: TextButton(
            child: const Text('Go to Sign In'),
            onPressed: () => authProvider.goToSignIn(),
          ),
        );
      default:
        return const SigninScreen();
    }
  }
}

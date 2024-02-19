import 'package:flutter/material.dart';
import 'package:kigo_app/login/presentation/registration_screen.dart';

class LoginPage extends Page<dynamic> {
  const LoginPage() : super(key: const ValueKey('AuthPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute<dynamic>(
        settings: this, builder: (_) => const RegistrationScreen());
  }
}

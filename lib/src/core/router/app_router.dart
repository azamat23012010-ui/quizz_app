import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/auth/screens/forgot_password.dart';
import 'package:quiz_app/src/features/auth/screens/login_screen.dart';
import 'package:quiz_app/src/features/auth/screens/sign_in.dart';
import 'package:quiz_app/src/features/auth/screens/sign_up.dart';
import 'package:quiz_app/src/features/home/screens/home_screen.dart';
import 'package:quiz_app/src/features/profile/screens/profile_screen.dart';
import 'package:quiz_app/src/features/settings/screens/settings_screen.dart';

class AppRouter {
  static Route? onGenarate(RouteSettings settings) {
    switch (settings.name) {
      case '/sign_up':
        return onPageChange(SignUpScreen());
      case '/sign_in':
        return onPageChange(SignInScreen());
        case '/login':
        return onPageChange(LoginScreen());
        case '/forgot_password':
        return onPageChange(ForgotPassword());
      case '/home':
        return onPageChange(HomeScreen());
      case '/profile':
        return onPageChange(ProfileScreen());
      case '/settings':
        return onPageChange(SettingsScreen());
      default:
        return onPageChange(SizedBox());
    }
  }

  static MaterialPageRoute onPageChange(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}

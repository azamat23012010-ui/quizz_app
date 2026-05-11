import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/auth/screens/sign_in.dart';
import 'package:quiz_app/src/features/auth/screens/sign_up.dart';
import 'package:quiz_app/src/features/home/screens/home_screen.dart';

class AppRouter {
  static Route? onGenarate(RouteSettings settings) {
    switch (settings.name) {
      case '/sign_up':
        return onPageChange(SignUpScreen());
      case '/sign_in':
        return onPageChange(SignInScreen());
      case '/home':
        return onPageChange(HomeScreen());
      default:
        return onPageChange(SizedBox());
    }
  }

  static MaterialPageRoute onPageChange(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/src/features/auth/cubit/google_sign.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: ()async {
            await GoogleSignCustom.signOut();
          },
          child: const Text('chiqish'),
        ),
      ),
    );
  }
}

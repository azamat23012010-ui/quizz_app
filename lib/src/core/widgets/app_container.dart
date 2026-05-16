import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/const/colors/app_colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 129,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.flord, width: 1),
        color: AppColors.mirage,
      ),
      child: child,
    );
  }
}
